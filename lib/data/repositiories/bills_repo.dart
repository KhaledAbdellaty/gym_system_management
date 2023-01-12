import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/bills.dart';

class BillsRepo {
  BillsRepo._();
  static BillsRepo? _instance;

  static BillsRepo get instance => _instance ?? BillsRepo._();

  addBill({required Bills bill}) {
    ObjectBox.billsBox.put(bill);
  }

  Stream<List<Bills>> getAllBills() {
    final builder = ObjectBox.billsBox.query();
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }

  Bills getBill(int id) {
    return ObjectBox.billsBox.get(id)!;
  }
}
