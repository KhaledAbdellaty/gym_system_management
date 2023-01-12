// // import 'package:data_table_2/data_table_2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:gym_managment/core/object_box.dart';
// // import 'package:gym_managment/data/model/classes.dart';
// // import 'package:gym_managment/data/model/member.dart';
// // import 'package:gym_managment/data/repositiories/member_repo.dart';
// // import 'package:gym_managment/main.dart';
// // import 'package:gym_managment/presentation/screens/second_test_screen.dart';
// // import 'package:sizer/sizer.dart';

// // class TestScfreen extends StatelessWidget {
// //   const TestScfreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Test')),
// //       body:
// //        StreamBuilder<List<Member>>(
// //         stream: MemberRepo.instance.getAllMembers(),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             final data = snapshot.data;
// //             return Column(
// //               children: [
// //                 Expanded(
// //                   child: DataTable2(columns: [
// //                     DataColumn2(
// //                       fixedWidth: 7.w,
// //                       label: const Text('ID'),
// //                     ),
// //                     const DataColumn2(label: Text('Name')),
// //                     const DataColumn2(label: Text('Phone No')),
// //                     const DataColumn2(label: Text('subscribes No')),
// //                   ], rows: [
// //                     for (var s = 0; s < data!.length; s++)
// //                       DataRow(cells: [
// //                         DataCell(
// //                           Text(data[s].id.toString()),
// //                           onTap: () => goToNextScreen(context, data[s]),
// //                         ),
// //                         DataCell(
// //                           Text(data[s].name.toString()),
// //                           onTap: () => goToNextScreen(context, data[s]),
// //                         ),
// //                         DataCell(Text(data[s].phoneNo.toString())),
// //                         DataCell(Text(data[s].subscribe.length.toString())),
// //                       ])
// //                   ]),
// //                 ),
// //                 Spacer(),
// //                 Row(
// //                   children: [
// //                     ElevatedButton(
// //                         onPressed: () {
// //                           MemberRepo.instance.addMember(
// //                               classes: Classes()
// //                                 ..className = 'ss'
// //                                 ..price = 20,
// //                               name: 'name',
// //                               gender: 'gender',
// //                               phoneNo: 'phoneNo',
// //                               createdBy: 'createdBy',
// //                               subscribeLong: 2);
// //                         },
// //                         child: Text('Add Member'))
// //                   ],
// //                 )
// //               ],
// //             );
// //           }
// //           return Text('No Data');
// //         },
// //       ),
// //     );
// //   }

// //   goToNextScreen(BuildContext context, Member member) {
// //     Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => SeconTestScreen(
// //             member: member,
// //           ),
// //         ));
// //     print(member.name);
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:gym_managment/presentation/screens/second_test_screen.dart';

// import '../../data/model/member.dart';

// class TestScreen extends StatelessWidget {
//   final Member member;
//   TestScreen({required this.member});

//   @override
//   Widget build(BuildContext context) {
//     print('Build Screen');

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: Column(
//         children: [
//           Text(member.id.toString()),
//           Text(member.name!),
//           Text(member.payments.first.bill.target!.status!),
//           Text(
//               'المبلغ المدفوع ${member.payments.first.bill.target!.paidPrice.toString()}'),
//           Text(
//               ' سعر الاشتراك ${member.payments.first.bill.target!.totalPrice.toString()}'),
//           Text(member.payments.first.bill.target!.deptPrice.toString()),
//         ],
//       )),
//     );
//   }
// }
