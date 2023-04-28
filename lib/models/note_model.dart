import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
@HiveField(0)
  String title;
@HiveField(01)
  String subtitle;
@HiveField(02)
   final String date;
@HiveField(03)
  int color;

  NoteModel( { required this.title,required this.date,required this.subtitle,required this.color});
}