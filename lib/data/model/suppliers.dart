import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Suppliers {
  @Id()
  int id;
  String? name;

  Suppliers({this.id = 0});
  final products = ToMany<Products>();
  final bills = ToMany<Bills>();
}
