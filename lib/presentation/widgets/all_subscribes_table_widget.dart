// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:sizer/sizer.dart';

// import '../../bussines_logic/member_cubit/member_cubit.dart';
// import '../../core/color.dart';
// import '../../data/model/member.dart';

// class AllSubscribeTableWidget extends StatelessWidget {
//   AllSubscribeTableWidget({super.key, required this.member});

//   final Member member;
//   final List<String> tableHeaderString = <String>[
//     'اسم الأشتراك',
//     'مدة الأشتراك',
//     'بداية الأشتراك',
//     'نهاية الأشتراك',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('الأشتراكات'),
//         SizedBox(
//           height: 0.5.h,
//         ),
//         Container(
//           color: Colors.amber,
//           height: 300,
//           width: 177.w,
//           child: BlocConsumer<MemberCubit, MemberState>(
//             listener: (context, state) {
//               if (state is SubscribesLoaded) {
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text(state.subscribes.length.toString())));
//               }
//             },
//             builder: (context, state) {
//               if (state is SubscribesLoaded) {
//                 return DataTable2(
//                   horizontalMargin: 3.w,
//                   dividerThickness: 2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: placeHolder,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black38,
//                         offset: Offset(0, 2),
//                         blurRadius: 6,
//                       )
//                     ],
//                   ),
//                   border: TableBorder(
//                     verticalInside: BorderSide(color: Colors.black12),
//                   ),
//                   columns: [
//                     for (var s = 0; s < tableHeaderString.length; s++)
//                       DataColumn(
//                         label: Text(
//                           tableHeaderString[s],
//                         ),
//                       ),
//                     const DataColumn(label: Text('تجديد الأشتراك')),
//                     const DataColumn(label: Text('حذف الأشتراك')),
//                   ],
//                   rows: [
//                     for (var f = 0; f < state.subscribes.length; f++)
//                       DataRow(
//                         cells: [
//                           DataCell(state.subscribes[f].classes.hasValue
//                               ? Text(state
//                                   .subscribes[f].classes.target!.className!)
//                               : Text('Null')),
//                           DataCell(Text(
//                               state.subscribes[f].subscribeLong.toString())),
//                           DataCell(Text(Jiffy(member.createdAt)
//                               .format('dd / MM / yyyy'))),
//                           DataCell(Text(Jiffy(member.createdAt)
//                               .add(months: state.subscribes[f].subscribeLong!)
//                               .format('dd / MM / yyyy'))),
//                           DataCell(
//                             ElevatedButton(
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     content: Container(
//                                       color: bgColor,
//                                       width: 80.w,
//                                       height: 20.h,
//                                       child: Center(
//                                           child: Text(state.subscribes[f]
//                                               .classes.target!.className!)),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'تجديد الأشتراك',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           DataCell(ElevatedButton(
//                             onPressed: () {
//                               // BlocProvider.of<MemberCubit>(context)
//                               //     .cancelSubscribe(
//                               //         subscribeModel: member.subscribe[f]);
//                             },
//                             child: Text('إلغاء الأشتراك'),
//                           ))
//                         ],
//                       ),
//                   ],
//                 );
//                 // } else if (state is MemberLoaded) {
//                 //   return DataTable2(
//                 //     horizontalMargin: 3.w,
//                 //     dividerThickness: 2,
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(15),
//                 //       color: placeHolder,
//                 //       boxShadow: const [
//                 //         BoxShadow(
//                 //           color: Colors.black38,
//                 //           offset: Offset(0, 2),
//                 //           blurRadius: 6,
//                 //         )
//                 //       ],
//                 //     ),
//                 //     border: TableBorder(
//                 //       verticalInside: BorderSide(color: Colors.black12),
//                 //     ),
//                 //     columns: [
//                 //       for (var s = 0; s < tableHeaderString.length; s++)
//                 //         DataColumn(
//                 //           label: Text(
//                 //             tableHeaderString[s],
//                 //           ),
//                 //         ),
//                 //       const DataColumn(label: Text('تجديد الأشتراك')),
//                 //       const DataColumn(label: Text('حذف الأشتراك')),
//                 //     ],
//                 //     rows: [
//                 //       for (var f = 0; f < member.subscribe.length; f++)
//                 //         DataRow(
//                 //           cells: [
//                 //             DataCell(member.subscribe[f].classes.hasValue
//                 //                 ? Text(member
//                 //                     .subscribe[f].classes.target!.className!)
//                 //                 : Text('Null')),
//                 //             DataCell(Text(
//                 //                 member.subscribe[f].subscribeLong.toString())),
//                 //             DataCell(Text(Jiffy(member.createdAt)
//                 //                 .format('dd / MM / yyyy'))),
//                 //             DataCell(Text(Jiffy(member.createdAt)
//                 //                 .add(months: member.subscribe[f].subscribeLong!)
//                 //                 .format('dd / MM / yyyy'))),
//                 //             DataCell(
//                 //               ElevatedButton(
//                 //                 onPressed: () {
//                 //                   showDialog(
//                 //                     context: context,
//                 //                     builder: (context) => AlertDialog(
//                 //                       content: Container(
//                 //                         color: bgColor,
//                 //                         width: 80.w,
//                 //                         height: 20.h,
//                 //                         child: Center(
//                 //                             child: Text(member.subscribe[f]
//                 //                                 .classes.target!.className!)),
//                 //                       ),
//                 //                     ),
//                 //                   );
//                 //                 },
//                 //                 child: Text(
//                 //                   'تجديد الأشتراك',
//                 //                   style: TextStyle(color: Colors.white),
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //             DataCell(ElevatedButton(
//                 //               onPressed: () {
//                 //                 BlocProvider.of<MemberCubit>(context)
//                 //                     .getAllSubscribes();
//                 //               },
//                 //               child: Text('إلغاء الأشتراك'),
//                 //             ))
//                 //           ],
//                 //         ),
//                 //     ],
//                 //   );
//               } else {
//                 return Center(
//                   child: Text('sssss'),
//                 );
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
