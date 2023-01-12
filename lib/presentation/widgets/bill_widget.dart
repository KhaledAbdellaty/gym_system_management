import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';
import 'package:gym_managment/presentation/screens/test_screen.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_field.dart';

class BillWidget extends StatelessWidget {
  final Member member;
  double billPrice, deptPrice;
  BillWidget({
    super.key,
    required this.member,
    required this.billPrice,
    required this.deptPrice,
  });

  final paymentController = TextEditingController();

  String formatSubscribeDate(DateTime dateTime) {
    return Jiffy(dateTime).format('dd / MM / yyyy');
  }

  final _billKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MemberCubit>();
    print('========== bill widget =================');
    return Form(
      key: _billKey,
      child: Expanded(
          // height: 70.h,width: 70.w,color: Colors.amber,
          child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('رقم العضو')),
              Expanded(flex: 5, child: Text(member.id.toString()))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('اسم العضو')),
              Expanded(flex: 5, child: Text(member.name!))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('رقم الموبايل')),
              Expanded(flex: 5, child: Text(member.phoneNo!))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('اسم الأشتراك')),
              Expanded(flex: 5, child: Text(member.classes.first.className!))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('مدة الأشتراك')),
              Expanded(
                  flex: 5,
                  child: Text('${member.subscribe.first.subscribeLong}  شهر'))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('بداية الأشتراك')),
              Expanded(
                  flex: 5,
                  child: Text(formatSubscribeDate(
                      member.subscribe.first.startSubscribe!)))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('نهاية الأشتراك')),
              Expanded(
                  flex: 5,
                  child: Text(formatSubscribeDate(
                      member.subscribe.first.endSubscribe!)))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('المبلغ المستحق ')),
              Expanded(flex: 5, child: Text(billPrice.toString())),
            ],
          ),
          CustomTextField(
            label: 'المبلغ المدفوع',
            controller: paymentController,
            onSaved: (value) {
              paymentController.text = value!;
              final paymentPrice = double.parse(paymentController.text);
              deptPrice = context
                  .read<MemberCubit>()
                  .totalDeptPrice(billPrice, paymentPrice, member);
            },
          ),
          Text('عليه : $deptPrice'),
          ElevatedButton(
            onPressed: () {
              _billKey.currentState!.save();
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: bloc,
                  child: AlertDialog(
                    content: BlocConsumer<MemberCubit, MemberState>(
                      listener: (context, state) {
                        if (state is MemberAddedBill) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is MemberLoaded) {
                          return Column(
                            children: [
                              Text(
                                state.totalPrice.toString(),
                              ),
                              Text(
                                state.totalPaid.toString(),
                              ),
                              Text(
                                state.totalDept.toString(),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                 
                                    Navigator.pop(context);
                                    context.read<MemberCubit>().addBillToMember(
                                        member: state.member!,
                                        totalPrice: state.totalPrice!,
                                        totalPaid: state.totalPaid!,
                                        totalDept: state.totalDept!);
                                  },
                                  child: Text('Add as payment'))
                            ],
                          );
                        } else {
                          return Center(
                            child: Text('Error'),
                          );
                        }
                      },
                    ),
                  ),
                ),
              );
            },
            child: Text('إنشاء فاتورة'),
          ),
        ],
      )),
    );
  }
}
