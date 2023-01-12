import 'package:flutter/material.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:jiffy/jiffy.dart';

Widget memberName(String name, BuildContext context) {
  return Text(
    name,
    style: Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(fontSize: MediaQuery.of(context).size.width / 41.5),
  );
}

Widget screenTitle(String screenTitle, BuildContext context) {
  return Text(
    screenTitle,
    style: Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(fontSize: MediaQuery.of(context).size.width / 63.5),
  );
}

String translateAccountsName(String name) {
  switch (name) {
    case subscribeAccount:
      return 'اشتراكات';
    case expanseAccount:
      return 'مصروفات';
    case sellProductAccount:
      return 'مبيعات';
    case buyProductAccount:
      return 'مشتريات';
  }
  return name;
}

String translateBillStatue(String statue) {
  switch (statue) {
    case unCompletedBillStatus:
      return 'غير مكتملة';
    case completedBillStatus:
      return 'مكتملة';
  }
  return statue;
}

String formatDateToString(DateTime date) {
  return Jiffy(date).format('dd /MM /yyyy ');
}
