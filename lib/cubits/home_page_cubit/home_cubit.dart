import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
int indx =0 ;
int index=0;
List list=[];
   add_button() {
    return
       FloatingActionButton(
      backgroundColor: Colors.grey,
          onPressed: () {
        indx = indx + 1;
        index = index + 1;
        print(indx);
        print(index);
        if(indx>=6){indx=0;}
        list.add('5');
        emit(HomeAdding());
      //  list.add(value)
      },
      child: const Icon(Icons.add,color: Colors.white));


  }




}
