import 'package:gym_managment/data/model/accounts.dart';
import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/expenses.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:gym_managment/data/model/subscribe.dart';

import '../data/model/member.dart';
import '../data/model/suppliers.dart';
import '../data/model/users.dart';
import '../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  static late Box<Member> memberBox;
  static late Box<SubscribeModel> subscribeBox;
  static late Box<Users> usersBox;
  static late Box<Classes> classsBox;
  static late Box<Products> productBox;
  static late Box<Expenses> expansesBox;
  static late Box<Bills> billsBox;
  static late Box<Accounts> accountsBox;
  static late Box<Payment> paymentBox;
  static late Box<Suppliers> suppliersBox;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
    memberBox = Box<Member>(store);
    subscribeBox = Box<SubscribeModel>(store);
    usersBox = Box<Users>(store);
    classsBox = Box<Classes>(store);
    productBox = Box<Products>(store);
    expansesBox = Box<Expenses>(store);
    billsBox = Box<Bills>(store);
    accountsBox = Box<Accounts>(store);
    paymentBox = Box<Payment>(store);
    suppliersBox = Box<Suppliers>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  // addNewProduct(
  //     {required String productName,
  //     required String companyName,
  //     required double price}) {
  //   final product = Products()
  //     ..name = productName
  //     ..companyName = companyName
  //     ..price;

  //   productBox.put(product);
  // }

  // Stream<List<Products>> getAllProducts() {
  //   final builder = productBox.query()..order(Products_.id);
  //   return builder.watch(triggerImmediately: true).map((event) => event.find());
  // }
}
