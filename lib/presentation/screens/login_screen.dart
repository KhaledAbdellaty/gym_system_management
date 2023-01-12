import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/users.dart';
import 'package:gym_managment/data/repositiories/users_repo.dart';
import 'package:gym_managment/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final userName = TextEditingController();
  final password = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            CustomTextField(
              label: 'Username',
              controller: userName,
              onSaved: (value) => userName.text = value!,
            ),
            CustomTextField(
              label: 'password',
              controller: password,
              onSaved: (value) => password.text = value!,
            ),
            ElevatedButton(
                onPressed: () {
                  _key.currentState!.save();
                  BlocProvider.of<AuthCubit>(context)
                      .login(userName.text, password.text, context);
                  print(userName.text);
                  print(password.text);
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
