import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Products {
  @Id()
  int? id;
  String? name;
  double? price;
  int? count;

  Products({this.id, this.name,this.price});

  final supplier = ToOne<Suppliers>();
}
