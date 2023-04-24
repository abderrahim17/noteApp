part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddNoteLoadding extends AddNoteState {}
class AddNoteSuccess extends AddNoteState {
  //List<Widget> noteListo ;
//HomeSuccess( {required this.noteListo});
}
class AddNoteFailure extends AddNoteState {
 final String exeption;
  AddNoteFailure({required this.exeption });
}

