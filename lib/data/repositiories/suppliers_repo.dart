import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:gym_managment/objectbox.g.dart';

class SuppliersRepo {
  SuppliersRepo._();

  static SuppliersRepo? _instance;
  static SuppliersRepo get instance => _instance ?? SuppliersRepo._();

  addSupplier({required String name}) {
    final supplier = Suppliers()..name = name;
    ObjectBox.suppliersBox.put(supplier);
  }

  Stream<List<Suppliers>> getsuppliersStream() {
    final builder = ObjectBox.suppliersBox.query()..order(Suppliers_.id);
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }

  List<Suppliers> getAllSuppliers() {
    return ObjectBox.suppliersBox.getAll();
  }
}
