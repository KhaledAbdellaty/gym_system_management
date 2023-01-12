import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/core/widgets.dart';
import 'package:gym_managment/presentation/screens/member_bills_screen.dart';
import 'package:jiffy/jiffy.dart';

import '../../bussines_logic/cubit/lay_outs_cubit.dart';
import '../../bussines_logic/member_cubit/member_cubit.dart';
import '../../data/model/member.dart';
import '../screens/member_product_screen.dart';
import '../screens/member_subscribes_screen.dart';

class MembersDetailsLayouts extends StatelessWidget {
  final Member member;
  final PageController pageController;
  MembersDetailsLayouts(
      {super.key, required this.pageController, required this.member});

  final List<String> tabsHead = [
    'الأشتراكات',
    'المنتجات',
    'الفواتير',
  ];

  @override
  Widget build(BuildContext context) {
    final ss = <Widget>[
      MemberSubscribersScreen(member: member),
      MemberProductsScreen(member: member),
      MemberBillsScreen(member: member),
    ];
    return Column(
      children: [
        tabBarHeader(context),
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: placeHolder)),
          child: PageView.builder(
            reverse: false,
            scrollDirection: Axis.vertical,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ss.length,
            itemBuilder: (context, index) {
              return ss[index];
            },
          ),
        ),
      ],
    );
  }

  Widget tabBarHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Wrap(
        children: List.generate(
          3,
          (index) => InkWell(
            onTap: () {
              context.read<LayOutsCubit>().layoutJumpToPage(index);
            },
            child: BlocBuilder<LayOutsCubit, LayOutsState>(
              builder: (context, state) {
                if (state is LayOutsMoved) {
                  return SizedBox(
                    height: 46,
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Column(
                        children: [
                          Text(
                            tabsHead[index],
                            style: state.index == index
                                ? const TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  )
                                : const TextStyle(
                                    color: placeHolder,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                          ),
                          const Spacer(),
                          state.index == index
                              ? Container(
                                  height: 2,
                                  decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 46,
                    width: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Column(
                        children: [
                          Text(
                            tabsHead[index],
                            style: index == 0
                                ? const TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  )
                                : const TextStyle(
                                    color: placeHolder,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                          ),
                          const Spacer(),
                          index == 0
                              ? Container(
                                  height: 2,
                                  decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
