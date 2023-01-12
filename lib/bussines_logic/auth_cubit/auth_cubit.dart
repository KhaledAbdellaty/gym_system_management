import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/data/model/users.dart';
import 'package:gym_managment/data/repositiories/users_repo.dart';

import '../../core/strings.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final box = AuthRepo.instance.authBox();

  createUser(Users user) {
    emit(AuthLoading());
    box.put(user);
    emit(CreatedUser());
  }

  List<Users> getAllUsers() {
    emit(AuthLoading());
    final users = box.getAll();

    emit(AuthLoaded(users: users));
    for (var s = 0; s < users.length; s++) {
      print(users[s].name);
    }
    return users;
  }

   login(String name, String password,BuildContext context) {
    emit(AuthLoading());
    final allUsers = getAllUsers();
    // final user = allUsers.singleWhere(
    //     (element) => element.name == name && element.password == password);
    allUsers.forEach((element) {
      if (element.name == name && element.password == password) {
        emit(AuthLogin(user: element));
        Navigator.pushNamed(context, homeScreen,arguments: BlocProvider.of<AuthCubit>(context));
        print(state);
      } else {
        emit(AuthLogOut());
        print(state);
      }
    });
  }

  
}
