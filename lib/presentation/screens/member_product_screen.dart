import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../data/model/member.dart';


class MemberProductsScreen extends StatelessWidget {
  final Member member;
  const MemberProductsScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('اضف منتج جديد'),
            ),
          ],
        ),
      ],
    );
  }

  productsMemberTable() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: DataTable2(columns: [
        DataColumn2(label: Text('ID')),
        DataColumn2(label: Text('اسم المنتج ')),
        DataColumn2(label: Text('سعر المنتج')),
      ], rows: [
        DataRow2(cells: [
          for (var s = 0; s < member.products.length; s++) ...[
            DataCell(Text(member.products[s].id.toString())),
            DataCell(Text(member.products[s].name!)),
            DataCell(Text(member.products[s].price.toString())),
          ],
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
      ]),
    );
  }
}
