import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/classes_cubit/classes_cubit.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/bussines_logic/navigator_cubit/navigator_cubit.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/responsive.dart';
import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/repositiories/accounts_repo.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';
import 'package:gym_managment/presentation/widgets/drawer_widget.dart';
import 'package:gym_managment/presentation/widgets/layout_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    // ObjectBox.billsBox.removeAll();
    // ObjectBox.memberBox.removeAll();
    // ObjectBox.paymentBox.removeAll();

    return Scaffold(
      key: context.read<NavigatorCubit>().scaffoldKey,
      drawer: DrawerWidget(),
      body: Row(
        children: [
          if (isFullScreen(context))
            Expanded(
              child: DrawerWidget(),
            ),
          Expanded(
            flex: 5,
            child: LayoutWidget(),
          ),
        ],
      ),
      //  ),
    );
  }
}
