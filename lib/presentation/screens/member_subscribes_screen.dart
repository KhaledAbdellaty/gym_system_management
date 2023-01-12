import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/widgets.dart';
import 'package:jiffy/jiffy.dart';

import '../../data/model/member.dart';
import 'add_subscribe_screen.dart';

class MemberSubscribersScreen extends StatelessWidget {
  final Member member;
  const MemberSubscribersScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // To put the Button on left
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: BlocProvider(
                        create: (context) => MemberCubit(),
                        child: AddSubscribeScreen(
                          member: member,
                        ),
                      ),
                    ),
                  );
                },
                child: Text('اشتراك جديد'),
              ),
            ),
          ],
        ),
        subscribesTable(),
      ],
    );
  }

  subscribesTable() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: DataTable2(columns: [
        DataColumn2(label: Text('ID')),
        DataColumn2(label: Text('نوع الاشتراك')),
        DataColumn2(label: Text('مدة الأشتراك')),
        DataColumn2(label: Text('بداية الأشتراك')),
        DataColumn2(label: Text('نهاية الأشتراك')),
        DataColumn2(label: Text('تجديد الأشتراك')),
        DataColumn2(label: Text('إلغاء الأشتراك')),
      ], rows: [
        for (var s = 0; s < member.subscribe.length; s++) ...[
          DataRow2(cells: [
            DataCell(Text(member.subscribe[s].id.toString())),
            DataCell(
                Text(member.subscribe[s].classes.target!.className.toString())),
            DataCell(Text(
                member.subscribe[s].subscribeLong.toString() + ' ' + 'شهر ')),
            DataCell(
                Text(formatDateToString(member.subscribe[s].startSubscribe!))),
            DataCell(
                Text(formatDateToString(member.subscribe[s].endSubscribe!))),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('تجديد'),
              ),
            )),
            DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('إلغاء'),
              ),
            ))
          ])
        ]
      ]),
    );
  }
}
