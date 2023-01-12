import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/core/widgets.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/repositiories/bills_repo.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';

class MemberBillsScreen extends StatelessWidget {
  final Member member;
  MemberBillsScreen({super.key, required this.member});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        billsTable(context),
      ],
    );
  }

  billsTable(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: BlocBuilder<MemberCubit, MemberState>(
        builder: (context, state) {
          if (state is MemberBillPayment) {
            return DataTable2(columns: [
              DataColumn2(label: Text('رقم الفاتورة')),
              DataColumn2(label: Text('نوع الفاتورة')),
              DataColumn2(label: Text('تاريخ المدفوعة')),
              DataColumn2(label: Text('إجمالي الفاتورة')),
              DataColumn2(label: Text('المبلغ المدفوع')),
              DataColumn2(label: Text('المبلغ المتبقي')),
              DataColumn2(label: Text('حالة الفاتورة')),
            ], rows: [
              for (var s = 0; s < state.bills.length; s++) ...[
                DataRow2(
                  cells: [
                    DataCell(Text(state.bills[s].id.toString())),
                    DataCell(Text(translateAccountsName(
                        state.bills[s].account.target!.accountName!))),
                    DataCell(Text(state.bills[s].billDate.toString())),
                    DataCell(Text(state.bills[s].totalPrice.toString())),
                    DataCell(Text(state.bills[s].paidPrice.toString())),
                    DataCell(Text(state.bills[s].deptPrice.toString())),
                    DataCell(InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            final bill = member.bills[s];
                            final payments = member.bills[s].payments;
                            return Container(
                              width: 800,
                              height: 500,
                              child: BlocProvider(
                                create: (context) => MemberCubit(),
                                child: AlertDialog(
                                  content: Column(
                                    children: [
                                      Column(
                                        children: [
                                          for (var s = 0;
                                              s < payments.length;
                                              s++) ...[
                                            Text(payments[s]
                                                .totalPayedPrice
                                                .toString()),
                                            Text(payments[s]
                                                .paymentDate
                                                .toString()),
                                          ],
                                          TextFormField(
                                            controller: controller,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                BlocProvider.of<MemberCubit>(
                                                        context)
                                                    .addAnotherPayment(
                                                        member: member,
                                                        billId: bill.id,
                                                        paidPrice: double.parse(
                                                            controller.text));
                                              },
                                              child: Text('Add'))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      child: Text(translateBillStatue(state.bills[s].status!)),
                    )),
                  ],
                ),
              ],
            ]);
          }
          return DataTable2(columns: [
            DataColumn2(label: Text('رقم الفاتورة')),
            DataColumn2(label: Text('نوع الفاتورة')),
            DataColumn2(label: Text('تاريخ المدفوعة')),
            DataColumn2(label: Text('إجمالي الفاتورة')),
            DataColumn2(label: Text('المبلغ المدفوع')),
            DataColumn2(label: Text('المبلغ المتبقي')),
            DataColumn2(label: Text('حالة الفاتورة')),
          ], rows: [
            for (var s = 0; s < member.bills.length; s++) ...[
              DataRow2(
                cells: [
                  DataCell(Text(member.bills[s].id.toString())),
                  DataCell(Text(translateAccountsName(
                      member.bills[s].account.target!.accountName!))),
                  DataCell(Text(member.bills[s].billDate.toString())),
                  DataCell(Text(member.bills[s].totalPrice.toString())),
                  DataCell(Text(member.bills[s].paidPrice.toString())),
                  DataCell(Text(member.bills[s].deptPrice.toString())),
                  DataCell(InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (_) {
                          final bill = member.bills[s];
                          final payments = member.bills[s].payments;
                          return Container(
                            width: 800,
                            height: 500,
                            child: BlocProvider(
                              create: (context) => MemberCubit(),
                              child: AlertDialog(
                                content: Column(
                                  children: [
                                    Column(
                                      children: [
                                        for (var s = 0;
                                            s < payments.length;
                                            s++) ...[
                                          Text(payments[s]
                                              .totalPayedPrice
                                              .toString()),
                                          Text(payments[s]
                                              .paymentDate
                                              .toString()),
                                        ],
                                        TextFormField(
                                          controller: controller,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<MemberCubit>(
                                                      context)
                                                  .addAnotherPayment(
                                                      member: member,
                                                      billId: bill.id,
                                                      paidPrice: double.parse(
                                                          controller.text));
                                            },
                                            child: const Text('Add'))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    child: Text(translateBillStatue(member.bills[s].status!)),
                  )),
                ],
              ),
            ],
          ]);
        },
      ),
    );
  }
}
