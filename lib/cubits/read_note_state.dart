part of 'read_note_cubit.dart';

@immutable
abstract class ReadNoteState {}

class ReadNoteInitial extends ReadNoteState {}
class ReadNoteLoading extends ReadNoteState {}
class ReadNoteSuccess extends ReadNoteState {

  final List<NoteModel> notes ;

  ReadNoteSuccess(this.notes);
}
class ReadNoteFailure extends ReadNoteState {
  final String exeption ;

  ReadNoteFailure(     { required this.exeption});
}
