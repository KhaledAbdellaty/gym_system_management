import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/all_members_table_widget.dart';
import '../../bussines_logic/member_cubit/member_cubit.dart';
import '../../bussines_logic/navigator_cubit/navigator_cubit.dart';
import 'member_details_screen.dart';

class AllMembersScreen extends StatelessWidget {
  AllMembersScreen({super.key});
  List<Member>? memberSearch;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ObjectBox.billsBox.removeAll();
    // ObjectBox.paymentBox.removeAll();
    // ObjectBox.memberBox.removeAll();
    // ObjectBox.subscribeBox.removeAll();

    print('============ All Member Screen =============');
    return Scaffold(
        appBar: CustomAppBar(
          controller: searchController,
          onSearchChange: (value) =>
              context.read<MemberCubit>().getMemberSearch(memberName: value),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: ElevatedButton(
                      onPressed: () =>
                          context.read<NavigatorCubit>().navigateToScreen(1),
                      child: const Text('إضافة عضو جديد')),
                ),
                membersTable(),
                MemberDetailsScreen(),
              ],
            ),
          ),
        ));
  }

  Widget membersTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<MemberCubit, MemberState>(
        builder: (context, state) {
          print('==== bloc start in members table ====');
          if (state is MemberStartSearching) {
            print('state is : ${state.runtimeType}');
            memberSearch = state.members;

            return AllMembersTableWidget(
                members: memberSearch!.reversed.toList());
          }
          print('state is : ${state.runtimeType}');

          return StreamBuilder<List<Member>>(
            stream: MemberRepo.instance.getAllMembers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Member> members = snapshot.data!;
                if (members.isEmpty) {
                  return const Center(
                    child: Text('Empty'),
                  );
                }
                return AllMembersTableWidget(members: members);
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
