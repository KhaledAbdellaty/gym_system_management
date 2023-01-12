import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:gym_managment/objectbox.g.dart';

class ProductsRepo {
  ProductsRepo._();
  static ProductsRepo? _instance;
  static ProductsRepo get instance => _instance ?? ProductsRepo._();

  Stream<List<Products>> getProductsStream() {
    final builder = ObjectBox.productBox.query()..order(Products_.id);
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }

  addNewProduct(
      {required String productName,
      required int quantity,
      required double price,
      required Suppliers supplier}) {
    final product = Products()
      ..name = productName
      ..count = quantity = quantity
      ..price = price
      ..supplier.target = supplier;

    supplier.products.add(product);
    ObjectBox.suppliersBox.put(supplier);
    ObjectBox.productBox.put(product);
  }
}
