import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';

part 'classes_state.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit() : super(ClassesInitial());
  // final box = ClassesRepo.instance.classesBox();
  // addClass(Classes classes) {
  //   box.put(classes);
  //   emit(ClassesAdded());
  // }

  // List<Classes> getAllClasses() {
  //   final classes = box.getAll();
  //   emit(ClassesLoaded(classes: classes));
  //   return classes;
  // }
}
