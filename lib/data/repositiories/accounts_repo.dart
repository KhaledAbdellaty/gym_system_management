import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/accounts.dart';
import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/payments.dart';

class AccountsRepo {
  AccountsRepo._();
  static AccountsRepo? _instance;

  static AccountsRepo get instance => _instance ?? AccountsRepo._();
  putAccounts() {
    final List<Accounts> accounts = [
      Accounts()..accountName = subscribeAccount,
      Accounts()..accountName = expanseAccount,
      Accounts()..accountName = buyProductAccount,
      Accounts()..accountName = sellProductAccount,
    ];
    ObjectBox.accountsBox.putMany(accounts);
  }

  // List<Accounts> getAllAccounts() {
  //   return ObjectBox.accountsBox.getAll();
  // }

  Stream<List<Accounts>> getAllAccounts() {
    final builder = ObjectBox.accountsBox.query();
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }

  Accounts subscribesAccount() {
    final accounts = ObjectBox.accountsBox.getAll();
    final sub = accounts.firstWhere(
        (account) => account.accountName!.contains(subscribeAccount));
    return sub;
  }

  Accounts expansesAccount() {
    final accounts = ObjectBox.accountsBox.getAll();
    final sub = accounts
        .firstWhere((account) => account.accountName!.contains(expanseAccount));
    return sub;
  }

  Accounts sellsProductsAccount() {
    final accounts = ObjectBox.accountsBox.getAll();
    final sub = accounts.firstWhere(
        (account) => account.accountName!.contains(sellProductAccount));
    return sub;
  }

  Accounts buyProductsAccount() {
    final accounts = ObjectBox.accountsBox.getAll();
    final sub = accounts.firstWhere(
        (account) => account.accountName!.contains(buyProductAccount));
    return sub;
  }
}
