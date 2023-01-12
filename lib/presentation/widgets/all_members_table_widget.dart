import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/presentation/widgets/status_widget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../core/strings.dart';

class AllMembersTableWidget extends StatelessWidget {
  final List<Member> members;
  const AllMembersTableWidget({
    super.key,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    print('============ Build All Members Table ===============');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: placeHolder),
      ),
      height: 274,
      child: DataTable2(
        decoration: BoxDecoration(
            //color: Colors.white,

            ),
        dividerThickness: 2,
        columns: [
          DataColumn2(
            fixedWidth: 15.w,
            label: const Text('ID'),
          ),
          const DataColumn2(label: Text('Name')),
          const DataColumn2(label: Text('Phone No')),
          const DataColumn2(label: Text('Status')),
        ],
        rows: [
          for (var s = 0; s < members.length; s++)
            DataRow2(
              onDoubleTap: () =>
                  BlocProvider.of<MemberCubit>(context).memberLoaded(),
              onTap: () {
                // Navigator.pushNamed(context, memberDetailsScreen,
                //   arguments: members[s]);

                BlocProvider.of<MemberCubit>(context).memberDetails(members[s]);
              },
              cells: [
                DataCell(Text(members[s].id.toString())),
                DataCell(Text(members[s].name.toString())),
                DataCell(Text(members[s].phoneNo.toString())),
                members[s].subscribe.last.endSubscribe != null
                    ? DataCell(StatueWidget(
                        statue: !members[s].subscribe.any((element) =>
                            element.endSubscribe!.month == DateTime.january)))
                    : DataCell(
                        StatueWidget(
                          statue: false,
                        ),
                      ),
              ],
            ),
        ],
      ),
    );
  }
}
