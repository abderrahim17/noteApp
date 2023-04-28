import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'package:note_app/models/note_model.dart';

import '../constants/constants.dart';

part 'read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());
  List<NoteModel>? note;

  FetchNote() {

    Hive.openBox<NoteModel>(kNotesBox);
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    note = noteBox.values.toList();

    emit(ReadNoteSuccess());
   print('salam');
//    debugPrint(note.toString());
  }
}
