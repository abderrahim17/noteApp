import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
@HiveField(0)
 final String title;
@HiveField(01)
  final String subtitle;
@HiveField(02)
   final String date;
@HiveField(03)
  final int color;

  NoteModel( { required this.title,required this.date,required this.subtitle,required this.color});
}