import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/navigator_cubit/navigator_cubit.dart';
import 'package:gym_managment/core/responsive.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorCubit, NavigatorCubitState>(
      builder: (context, state) {
        return Column(
          children: [    
            Expanded(
              child: PageView.builder(
                itemCount: state.screens.length,
                itemBuilder: (context, index) {
                  return state.screens.values.elementAt(state.index);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
