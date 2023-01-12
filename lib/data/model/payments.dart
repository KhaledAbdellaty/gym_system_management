import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class Payment {
  @Id()
  int id = 0;
  @Property(type: PropertyType.date)
  DateTime paymentDate;
  // double? totalPaymentPrice;
  double? totalPayedPrice;
  // double? totaldeptPrice;
  Payment({
    DateTime? paymentDate,
  }) : paymentDate = paymentDate ?? DateTime.now();
  //final member = ToOne<Member>();
  var bill = ToOne<Bills>();
}
