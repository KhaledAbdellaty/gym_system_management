// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../bussines_logic/member_cubit/member_cubit.dart';

// class MembersOverviewWidget extends StatelessWidget {
//   const MembersOverviewWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberCubit, MemberState>(
//       builder: (context, state) {
//         if (state is MemberLoaded) {
//           return Card(
//             child:  Text(state.members.length.toString()),
//           );
//         }
//         return Text('No Members Loaded');
//       },
//     );
//   }
// }
