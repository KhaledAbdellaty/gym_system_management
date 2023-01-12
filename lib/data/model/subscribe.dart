import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class SubscribeModel {
  @Id()
  int id = 0;
  int? subscribeLong;
  @Property(type: PropertyType.date)
  DateTime? startSubscribe, endSubscribe;

  SubscribeModel({this.subscribeLong});
  var classes = ToOne<Classes>();
  var member = ToOne<Member>();
}
