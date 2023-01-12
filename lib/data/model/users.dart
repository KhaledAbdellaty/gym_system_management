import 'package:objectbox/objectbox.dart';


@Entity()
class Users {
  @Id()
  int? id;
   String? name, phoneNo, password;
   String? auth;

  Users({
    this.id,
    this.name,
    this.phoneNo,
    this.auth,
    this.password,
  });
}
