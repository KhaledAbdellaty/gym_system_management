import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Accounts {
  @Id()
  int id = 0;
  String? accountName;

  var payments = ToMany<Payment>();
}
