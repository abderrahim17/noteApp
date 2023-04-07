import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int indx = 0;

  int index = 0;
  int indexo = -1;

  void add_button() {
    indx = indx + 1;
    index = index + 1;
    indexo=indexo+1;
    //print(indx);
    print(index);
    if (indx >= 6) {
      indx = 0;
    }
    emit(HomeAdding());
  }
}
