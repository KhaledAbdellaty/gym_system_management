import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:objectbox/objectbox.dart';

import 'classes.dart';

@Entity()
class Member {
  @Id()
  int id = 0;
  String? gender;
  String? name, createdBy, phoneNo;
  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Backlink()
  final subscribe = ToMany<SubscribeModel>();
  final classes = ToMany<Classes>();
  final products = ToMany<Products>();

  Member({
    this.gender,
    this.createdBy,
    this.name,
    this.phoneNo,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  final bills = ToMany<Bills>();
}
