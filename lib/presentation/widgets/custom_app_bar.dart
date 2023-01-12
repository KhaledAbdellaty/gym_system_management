import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/bussines_logic/navigator_cubit/navigator_cubit.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/core/widgets.dart';
import 'package:gym_managment/presentation/widgets/custom_serach_field.dart';
import 'package:sizer/sizer.dart';

import '../../core/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  ValueSetter<String>? onSearchChange;
  TextEditingController controller = TextEditingController();
  CustomAppBar(
      {super.key, required this.onSearchChange, required this.controller});
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final screenHeadTitle = BlocProvider.of<NavigatorCubit>(context)
        .state
        .screens
        .keys
        .elementAt(BlocProvider.of<NavigatorCubit>(context).state.index);
    return Container(
      padding: const EdgeInsets.only(top: 13, bottom: 13, right: 10),
      color: yellowColor,
      child: Row(
        children: [
          if (notFullScreen(context))
            IconButton(
              onPressed: () => context.read<NavigatorCubit>().controlMenu(),
              icon: const Icon(
                Icons.menu,
                color: blueColor,
              ),
            ),
          SizedBox(
            width: 10,
          ),
          screenTitle(screenHeadTitle, context),
          // Text(
          //   screenHeadTitle,
          //   style: Theme.of(context).textTheme.headline2,
          // ),
          Spacer(),
          CustomSearchField(
            controller: controller,
            onChange: onSearchChange,
          ),
          SizedBox(
            width: 45,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: yellowFillColor,
                shape: BoxShape.circle,
                border: Border.all(color: yellowBorderColor, width: 2)),
            child: Image.asset(
              'assets/icons/Bell 3.png',
              scale: 4,
            ),
          ),
          SizedBox(
            width: 34,
          ),
          SizedBox(
            height: 70,
            width: 290,
            child: Row(
              children: [
                InkWell(
                  splashColor: yellowBorderColor,
                  radius: 50,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    print('object');
                  },
                  child: Image.asset(
                    'assets/icons/arrow.png',
                    scale: 6,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 153,
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Khaled',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Admin',
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: yellowBorderColor, width: 2)),
                  child: Center(
                    child: Text('A'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
