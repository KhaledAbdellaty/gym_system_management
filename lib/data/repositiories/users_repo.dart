import 'package:gym_managment/data/model/users.dart';
import 'package:gym_managment/main.dart';

import '../../objectbox.g.dart';


class AuthRepo {
  AuthRepo._();
  static AuthRepo? _instance;

  static AuthRepo get instance => _instance ?? AuthRepo._();

  Box<Users> authBox() {
    final box = objectBox.store.box<Users>();
    return box;
  }
}
