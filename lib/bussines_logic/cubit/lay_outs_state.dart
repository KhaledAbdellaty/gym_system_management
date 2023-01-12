part of 'lay_outs_cubit.dart';

abstract class LayOutsState extends Equatable {
  const LayOutsState();

  @override
  List<Object> get props => [];
}

class LayOutsInitial extends LayOutsState {}

class LayOutsMoved extends LayOutsState {
  final int index;

 const LayOutsMoved({required this.index});
 
  @override
  List<Object> get props => [index];

}
