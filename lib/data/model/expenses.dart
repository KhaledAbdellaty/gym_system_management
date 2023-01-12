import 'package:gym_managment/data/model/accounts.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Expenses {
  @Id()
  int id = 0;
  final accounts = ToMany<Accounts>();
}
