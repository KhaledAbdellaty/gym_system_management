import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/presentation/widgets/status_widget.dart';
import '../../bussines_logic/cubit/lay_outs_cubit.dart';
import '../../bussines_logic/member_cubit/member_cubit.dart';
import '../../core/color.dart';
import '../../core/widgets.dart';
import '../widgets/members_details_layouts.dart';

class MemberDetailsScreen extends StatelessWidget {
  MemberDetailsScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('================== Build Member Details Screen ===================');
    return BlocProvider(
      create: (context) => LayOutsCubit(),
      child: BlocBuilder<MemberCubit, MemberState>(builder: (context, state) {
        if (state is MemberDetails) {
          return Column(
            children: [
              headerMemberDetails(state, context),
              MembersDetailsLayouts(
                pageController: context.read<LayOutsCubit>().pageController,
                member: state.member,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }

  Widget headerMemberDetails(MemberDetails state, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: placeHolder)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              memberName(state.member.name!, context),
              Text(
                state.member.phoneNo!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),

     
          const SizedBox(
            width: 50,
          ),
          StatueWidget(
              statue: !state.member.subscribe.any(
                  (element) => element.endSubscribe!.month == DateTime.january))
        ],
      ),
    );
  }

 
}
