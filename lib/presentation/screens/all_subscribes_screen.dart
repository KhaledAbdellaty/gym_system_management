import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:jiffy/jiffy.dart';

import '../../data/repositiories/suscribe_repo.dart';

class AllSubscribesScreen extends StatelessWidget {
  AllSubscribesScreen({super.key});
  final searchSubscribeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: searchSubscribeController),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            StreamBuilder<List<SubscribeModel>>(
                stream: SusbcribesRepo.instance.getSubscribesStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return SizedBox(
                        height: 500,
                        child: DataTable2(columns: const [
                          DataColumn2(label: Text('Id')),
                          DataColumn2(label: Text('اسم الأشتراك')),
                          DataColumn2(label: Text('مدة الأشتراك')),
                          DataColumn2(label: Text('بداية الأشتراك')),
                          DataColumn2(label: Text('نهاية الأشتراك')),
                          DataColumn2(label: Text('العضو ')),
                        ], rows: [
                          for (var s = 0; s < snapshot.data!.length; s++) ...[
                            DataRow2(cells: [
                              DataCell(Text(snapshot.data![s].id.toString())),
                              DataCell(Text(snapshot
                                  .data![s].classes.target!.className
                                  .toString())),
                              // DataCell(Text('ss')),
                              DataCell(Text(
                                  snapshot.data![s].subscribeLong.toString())),
                              DataCell(Text(
                                  Jiffy(snapshot.data![s].startSubscribe)
                                      .format('dd/ MM/ yyyy'))),
                              DataCell(Text(
                                  Jiffy(snapshot.data![s].endSubscribe)
                                      .format('dd/ MM/ yyyy'))),
                              DataCell(Text(snapshot
                                  .data![s].member.target!.name
                                  .toString())),
                            ])
                          ]
                        ]),
                      );
                    } else {
                      return Center(
                        child: Text('Empty'),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
