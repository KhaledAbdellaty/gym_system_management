import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/presentation/screens/login_screen.dart';
import 'package:gym_managment/presentation/screens/member_details_screen.dart';

import '../bussines_logic/classes_cubit/classes_cubit.dart';
import '../bussines_logic/member_cubit/member_cubit.dart';
import '../bussines_logic/navigator_cubit/navigator_cubit.dart';
import '../presentation/screens/home_screen.dart';

class AppRouter {
  // AuthCubit _authCubit = AuthCubit();
  // MemberCubit _memberCubit = MemberCubit();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => NavigatorCubit(),
            ),
            BlocProvider<MemberCubit>(
              create: (context) => MemberCubit(),
            ),
            BlocProvider(
              create: (context) => ClassesCubit(),
            ),
//            BlocProvider.value(value: _authCubit),
          ], child: HomeScreen()),
        );
      // case loginScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider<AuthCubit>(
      //       create: (context) => _authCubit,
      //       child: LoginScreen(),
      //     ),
      //   );
      // case memberDetailsScreen:
      //   final Member member = settings.arguments as Member;
      //   return MaterialPageRoute(
      //     // builder: (context) => BlocProvider<MemberCubit>(
      //     //   create: (context) => _memberCubit ,
      //     //   child: MemberDetailsScreen(
      //     //     member: member,
      //     //   ),
      //     // ),
      //     builder: (context) => MemberDetailsScreen(member: member),
      //   );
    }
  }
}
