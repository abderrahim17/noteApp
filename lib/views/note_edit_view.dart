import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/cubits/read_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_item.dart';

import '../cubits/home_page_cubit/add_note_cubit.dart';
import '../widgets/textField_Custom.dart';

class NoteEditView extends StatelessWidget {
  NoteEditView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  String? title, text;

  static String id = 'NoteEditView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Edit Note',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20.0),
                  child: IconButton(
                      onPressed: () {
                        ///title of the note model shouldn't be final

                        note.title = title ??
                            note.title; // if title was null so use the old title
                        note.subtitle = text ?? note.subtitle;

                        note.save();
                        BlocProvider.of<ReadNoteCubit>(context).FetchNote();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done)),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 15, left: 15),
            child: Column(
              children: [
                CustomTextField(
                  hint: note.title,
                  onchanged: (data) {
                    title = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    maxlines: 8,
                    hint: 'Contain',
                    onchanged: (data) {
                      text = data;
                    }),
                const SizedBox(height: 15),
                
                EditNoteColorsList(note: note,),
              ],
            ),
          ),
        ));
  }
}
class EditNoteColorsList extends StatefulWidget {
   const EditNoteColorsList({Key? key, required this.note}) : super(key: key);
final NoteModel note ;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
late  int currentindex ;
@override
/// intialase the value of current state before use it in the class
///the value is coming from the index of the list
void initState() {
    currentindex= kColor.indexOf(Color(widget.note.color));
    debugPrint('$currentindex');
   // ColorsItem(isPicked: true, color: kColor[2],);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:38*2 ,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
              child: GestureDetector(
                onTap: (){
                 // initState();
                  currentindex =index ;
widget.note.color=kColor[index].value;
 debugPrint('$currentindex');
 debugPrint('$index');
                  setState(() {});
                },
                child: ColorsItem(isPicked: currentindex ==index ,
                  color:kColor [index ],
                ),
              ),
            );
          } ),
    );
  }
}
