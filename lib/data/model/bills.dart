import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:objectbox/objectbox.dart';

import 'accounts.dart';

@Entity()
class Bills {
  @Id()
  int id = 0;
  String? status;
  double? totalPrice, deptPrice, paidPrice;
  @Property(type: PropertyType.date)
  DateTime billDate;
  Bills({
    DateTime? billDate,
  }) : billDate = billDate ?? DateTime.now();
  final member = ToOne<Member>();
  @Backlink()
  final payments = ToMany<Payment>();
  final account = ToOne<Accounts>();
}
