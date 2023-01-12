import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'lay_outs_state.dart';

class LayOutsCubit extends Cubit<LayOutsState> {
  LayOutsCubit() : super(LayOutsInitial());
  final PageController _pageController = PageController()..addListener(() {});
  PageController get pageController => _pageController;
  layoutJumpToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
    emit(LayOutsMoved(index: index));
  }
}
