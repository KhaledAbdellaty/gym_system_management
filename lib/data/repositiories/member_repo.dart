import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/accounts.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/repositiories/accounts_repo.dart';
import 'package:gym_managment/data/repositiories/payments_repo.dart';
import 'package:gym_managment/data/repositiories/suscribe_repo.dart';
import 'package:gym_managment/main.dart';

import '../../core/object_box.dart';
import '../../objectbox.g.dart';
import '../model/bills.dart';
import '../model/classes.dart';
import '../model/member.dart';
import '../model/products.dart';
import '../model/subscribe.dart';

class MemberRepo {
  MemberRepo._();
  static MemberRepo? _instance;

  static MemberRepo get instance => _instance ?? MemberRepo._();

  int addMember({
    required String name,
    required String gender,
    required String phoneNo,
    required String createdBy,
    required Classes classes,
    required int subscribeLong,
    required DateTime startSubscribe,
    required DateTime endSubscribe,
  }) {
    // Classes classes = Classes(className: 'gym', price: 50, sessionsCount: 20);

    final Member member = Member()
      ..classes.add(classes)
      ..createdBy = createdBy
      ..gender = gender
      ..name = name
      ..phoneNo = phoneNo;

    SubscribeModel subscribeModel = SubscribeModel()
      ..member.target = member
      ..classes.target = classes
      ..subscribeLong = subscribeLong
      ..startSubscribe = startSubscribe
      ..endSubscribe = endSubscribe;

    member.subscribe.add(subscribeModel);
    // ObjectBox.subscribeBox.pu
    return ObjectBox.memberBox.put(member);
  }

  Member getMember(final int memberId) {
    return ObjectBox.memberBox.get(memberId)!;
  }

  deleteMember({required int id}) {
    ObjectBox.memberBox.remove(id);
  }

  List<Member> allMemberList() {
    return ObjectBox.memberBox.getAll();
  }

  Stream<List<Member>> getAllMembers() {
    final builer = ObjectBox.memberBox.query()
      ..order(Member_.id, flags: Order.descending);
    return builer.watch(triggerImmediately: true).map((event) => event.find());
  }

  Stream<List<SubscribeModel>> getMemberSubscribes(int memberId) {
    final builder = ObjectBox.subscribeBox.query()..order(SubscribeModel_.id);
    builder.link(SubscribeModel_.member, Member_.id.equals(memberId));
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }

  Bills addBillToMember({
    required String accountName,
    required Member member,
    required double price,
   required double deptPrice,
    required double paidPrice,
    //TODO if(payPrice < price) status = Uncompleted ,else Completed
  }) {
    String status;
   // double deptPrice = 0.0;
    if (deptPrice == 0.0) {
      status = completedBillStatus;
    } else {
      status = unCompletedBillStatus;
    }
    Accounts account = AccountsRepo.instance.subscribesAccount();

    Bills bill = Bills()
      ..member.target = member
      ..account.target = account
      ..totalPrice = price
      ..deptPrice = deptPrice
      ..paidPrice = paidPrice
      ..status = status;
    return bill;
  }

  addPayment({
    required Bills bill,
    required Member member,
  }) {
    Accounts account = AccountsRepo.instance.subscribesAccount();

    var payment = Payment()
      ..bill.target = bill
      ..totalPayedPrice = bill.paidPrice;
    bill.payments.add(payment);
    account.payments.add(payment);
    member.bills.add(bill);
    ObjectBox.memberBox.put(member);
    ObjectBox.billsBox.put(bill);
  }
}
