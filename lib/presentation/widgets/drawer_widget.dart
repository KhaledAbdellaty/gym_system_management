import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_managment/core/color.dart';

import '../../bussines_logic/navigator_cubit/navigator_cubit.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('====================DrawerWidget==================');
    return Drawer(
      child: Material(
        color: blueColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BlocBuilder<NavigatorCubit, NavigatorCubitState>(
            builder: (context, state) {
              return Column(
                children: [
                  header(),
                  SizedBox(
                    height: 30,
                  ),
                  for (var s = 0; s < state.screens.length; s++)
                    DrawerLabel(
                      isSelected: s == state.index,
                      text: state.screens.keys.elementAt(s),
                      onTap: () {
                        BlocProvider.of<NavigatorCubit>(context)
                            .navigateToScreen(s);
                        print(s);
                        print(state.index);
                      },
                    ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Hello, Admin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class DrawerLabel extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  const DrawerLabel({
    super.key,
    this.isSelected = false,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.blueGrey.shade300,
      splashColor: primaryColor,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        color: isSelected ? yellowColor : Colors.transparent,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
