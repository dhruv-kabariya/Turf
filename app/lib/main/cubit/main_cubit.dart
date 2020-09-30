import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(Ground(i: 0));
  final StreamController<int> indexController =
      StreamController<int>.broadcast()..add(0);
  Stream<int> get currentIndex => indexController.stream.asBroadcastStream();

  void changePage(int index) {
    List<MainState> pages = [
      Ground(i: 0),
      Search(i: 1),
      Bookmark(i: 2),
      Setting(i: 3)
    ];
    if (state != pages[index]) {
      indexController.add(index);
      emit(pages[index]);
    }
  }

  dispose() {
    indexController.close();
  }
}
