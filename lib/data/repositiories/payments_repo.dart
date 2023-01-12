import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/objectbox.g.dart';

class PaymentsRepo {
  PaymentsRepo._();
  static PaymentsRepo? _instance;

  static PaymentsRepo get instance => _instance ?? PaymentsRepo._();
  addPayment({required Payment payment}) {
    ObjectBox.paymentBox.put(payment);
  }

  Stream<List<Payment>> getAllPayments() {
    final builder = ObjectBox.paymentBox.query();
   // builder.link(Payment_.member, Member_.id.equals(memberId));
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }
}
