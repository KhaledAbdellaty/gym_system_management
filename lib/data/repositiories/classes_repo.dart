import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/main.dart';

import '../../objectbox.g.dart';

class ClassesRepo {
  ClassesRepo._();
  static ClassesRepo? _instance;

  static ClassesRepo get instance => _instance ?? ClassesRepo._();
  // Box<Classes> classesBox() {
  //   final box = objectBox.store.box<Classes>();
  //   return box;
  // }

  addClass(
      {required String className,
      required double price,
      required int sessionsCount}) {
    final classes = Classes()
      ..className = className
      ..price = price
      ..sessionsCount = sessionsCount;

    ObjectBox.classsBox.put(classes);
  }

  List<Classes> getAllClasses() {
    return ObjectBox.classsBox.getAll();
  }
}
