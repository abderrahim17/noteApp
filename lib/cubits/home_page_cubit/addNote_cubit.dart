import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/costatnts/Constants.dart';

import '../../models/note_model.dart';

part 'addNote_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note)async{
    ///to create then add to the box created
    emit(AddNoteLoadding());

   try{ var NoteBox = Hive.box<NoteModel >(kNotesBox);
   emit(AddNoteSuccess());
   await NoteBox.add(note);}
   catch(e){
     emit(AddNoteFailure(exeption: e.toString()));
   }
  }



  // int indx = 0;
  //
  // int index = 0;
  // int indexo = -1;
  //
  // void add_button() {
  //   indx = indx + 1;
  //   index = index + 1;
  //   indexo=indexo+1;
  //   //print(indx);
  //   print(index);
  //   if (indx >= 6) {
  //     indx = 0;
  //   }
  //   emit(HomeAdding());
//   }
 }
