import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/presentation/screens/all_members_screen.dart';
import 'package:gym_managment/presentation/screens/all_subscribes_screen.dart';
import 'package:gym_managment/presentation/screens/classes_screen.dart';
import 'package:gym_managment/presentation/screens/inventory_screen.dart';
import 'package:gym_managment/presentation/screens/add_members_screen.dart';
import 'package:gym_managment/presentation/screens/orders_screen.dart';
import 'package:gym_managment/presentation/screens/products_screen.dart';
import 'package:gym_managment/presentation/screens/suppliers_screen.dart';
import 'package:meta/meta.dart';

import '../../presentation/screens/dashboard_screen.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorCubitState> {
  NavigatorCubit() : super(NavigatorCubitState());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  void navigateToScreen(int index) {
    emit(state.copyWith(index: index));
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
