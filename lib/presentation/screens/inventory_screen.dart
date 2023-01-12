import 'package:flutter/material.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/repositiories/accounts_repo.dart';
import 'package:gym_managment/data/repositiories/payments_repo.dart';
import 'package:gym_managment/data/repositiories/suscribe_repo.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';

import '../../data/model/accounts.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: TextEditingController()),
      body: Column(
        children: [],
      ),
    );
  }
}
