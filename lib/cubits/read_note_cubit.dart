import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import '../costatnts/Constants.dart';

part 'read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());


  FetchNote(NoteModel note){



    try{

      var NoteBox = Hive.box<NoteModel >(kNotesBox);

  List<NoteModel> note = NoteBox.values.toList();
  emit(ReadNoteSuccess(note));}
    catch(e){
      emit(ReadNoteFailure(exeption: e.toString()));
    }
}}
