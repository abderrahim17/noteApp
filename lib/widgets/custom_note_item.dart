import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/read_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/note_edit_view.dart';

class CustomNoteItem extends StatelessWidget {
  CustomNoteItem({
    // required this.i,
    // required this.title,
    // required this.text,
    // required this.date,
    // required this.color,
   required this.note});
final NoteModel note;
  // String title, text, date;
  //
  // List<Color> color = [];
  // int i;

  @override
  Widget build(BuildContext context) {
    // if (i > 6) {
    //   i = 0;
    // }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
      Navigator.pushNamed(context,NoteEditView.id);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color:Color(note.color),
          ),
          height: MediaQuery.of(context).size.height / 4,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Text(
                          note.subtitle,
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){

                  note.delete();
                  BlocProvider.of<ReadNoteCubit>(context).FetchNote();

                  }, icon: Icon(Icons.delete)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(note.date),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
