import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/repositiories/bills_repo.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';
import 'package:gym_managment/data/repositiories/suscribe_repo.dart';
import 'package:jiffy/jiffy.dart';

import '../../data/model/bills.dart';
import '../../data/model/member.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(MemberInit());

  // formatSubscribeDate(DateTime dateTime) {
  //   final date = Jiffy(dateTime).format('dd / MM / yyyy');
  // }

  memberLoaded() {
    emit(MemberLoaded());
  }

  bool validateMember({
    required String memberName,
    required String phoneNo,
    required String gender,
    required int subscribeLong,
  }) {
    // emit(state.copyWith(memberStatus: MemberStatus.memberLoading));
    if (memberName.trim().isEmpty ||
        phoneNo.trim().isEmpty ||
        gender.trim().isEmpty ||
        subscribeLong == 0) {
      print('Please add fill Data');

      emit(MemberFailed(errorMsg: 'برجاء إدخال البيانات'));

      return false;
    } else {
      final members = MemberRepo.instance.allMemberList();
      for (var member in members) {
        if (member.name!.trim().contains(memberName)) {
          emit(MemberFailed(errorMsg: 'الأسم موجود بالفعل'));
          return false;
        } else if (member.phoneNo!.trim().contains(phoneNo)) {
          emit(MemberFailed(errorMsg: 'الرقم مسجل بالفعل'));
          return false;
        }
      }
      emit(MemberSuccess(errorMsg: 'تم الاضافة بنجاح'));

      return true;
    }
  }

  memberDetails(Member member) {
    emit(MemberDetails(member));
  }

  addMember({
    required Classes? classe,
    required int subscribeLong,
    required String memberName,
    required String gender,
    required String phoneNo,
  }) {
    final validate = validateMember(
      memberName: memberName,
      phoneNo: phoneNo,
      subscribeLong: subscribeLong,
      gender: gender,
    );
    if (validate) {
      DateTime startSubscribe = DateTime.now();
      DateTime endSubscribe =
          Jiffy(startSubscribe).add(months: subscribeLong).dateTime;

      final memberId = MemberRepo.instance.addMember(
          name: memberName,
          gender: gender,
          endSubscribe: endSubscribe,
          startSubscribe: startSubscribe,
          phoneNo: phoneNo,
          createdBy: 'createdBy',
          classes: classe!,
          subscribeLong: subscribeLong);
      Member member = MemberRepo.instance.getMember(memberId);
      final price = subscribeLong * classe.price!;
      emit(MemberLoaded(member: member, totalPrice: price));

      print('validate');
    } else {
      print('no validate');
    }
  }

  addBillToMember({
    required Member member,
    required double totalPrice,
    required double totalPaid,
    required double totalDept,
  }) {
    final bill = MemberRepo.instance.addBillToMember(
        accountName: subscribeAccount,
        member: member,
        price: totalPrice,
        deptPrice: totalDept,
        paidPrice: totalPaid);
    MemberRepo.instance.addPayment(
      bill: bill,
      member: member,
    );
    emit(MemberAddedBill(message: 'تم الدفع بنجاح', bill: bill));
  }

  List<Member> getMemberSearch({required String memberName}) {
    final members = MemberRepo.instance.allMemberList();
    //final List<Member> list = [];
    members.removeWhere((member) =>
        !member.name!.toLowerCase().contains(memberName.toLowerCase()));
    emit(MemberStartSearching(members: members));
    return members;
  }

  double totalDeptPrice(double price, double paymentPrice, Member member) {
    double dept = 0;
    if (paymentPrice < price) {
      dept = price - paymentPrice;
      emit(MemberLoaded(
          member: member,
          totalDept: dept,
          totalPaid: paymentPrice,
          totalPrice: price));
      return dept = price - paymentPrice;
    } else {
      emit(MemberLoaded(
          member: member,
          totalDept: dept,
          totalPaid: paymentPrice,
          totalPrice: price));
      return dept;
    }
  }

  addAnotherPayment(
      {required Member member,
      required int billId,
      required double paidPrice}) {
    final Bills bill =
        member.bills.firstWhere((element) => element.id == billId);
    bill.payments.add(Payment()..totalPayedPrice = paidPrice);
    List<double> price = [];
    for (var s = 0; s < bill.payments.length; s++) {
      price.add(bill.payments[s].totalPayedPrice!);
    }
    final total = price.reduce((value, element) => value + element);
    String billStatue =
        total < bill.totalPrice! ? unCompletedBillStatus : completedBillStatus;

    bill.status = billStatue;
    bill.paidPrice = total;
    bill.deptPrice = bill.totalPrice! - total;
    BillsRepo.instance.addBill(bill: bill);
    emit(MemberDetails(member));
  }

  addProductToMember({required Member member, required Products product}) {
    member.products.add(product);
    ObjectBox.memberBox.put(member);
    emit(MemberDetails(member));
  }

  addSubscribeToMember(
      {required Member member,
      required int subscribeLong,
      required Classes classe}) {
    SubscribeModel subscribeModel = SubscribeModel()
      ..member.target = member
      ..startSubscribe = DateTime.now()
      ..subscribeLong = subscribeLong
      ..classes.target = classe;
    final DateTime endSubscribe = Jiffy(subscribeModel.startSubscribe)
        .add(months: subscribeLong)
        .dateTime;
    subscribeModel.endSubscribe = endSubscribe;

    member.subscribe.add(subscribeModel);
    ObjectBox.memberBox.put(member);
    addBillToMember(
      member: member,
      totalPrice: classe.price! * subscribeLong,
      totalPaid: 0,
      totalDept: classe.price! * subscribeLong,
    );
    emit(MemberDetails(member));
  }
}
