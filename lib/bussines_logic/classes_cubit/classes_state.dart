part of 'classes_cubit.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesInitial extends ClassesState {}

class ClassesLoading extends ClassesState {}

class ClassesLoaded extends ClassesState {
  final List<Classes> classes;
  const ClassesLoaded({required this.classes});
  @override
  List<Object> get props => [classes];
}

class ClassesAdded extends ClassesState {}

class ClassesRemoved extends ClassesState {}
