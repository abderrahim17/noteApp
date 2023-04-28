
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

import '../cubits/read_note_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ReadNoteCubit, ReadNoteState>(
        builder: (context, state) {
          if(state is ReadNoteInitial){
          BlocProvider.of<ReadNoteCubit>(context).FetchNote();}
          List<NoteModel>? notes = BlocProvider.of<ReadNoteCubit>(context).note?? [];
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          //debugPrint(notes[0].title);
        return CustomNoteItem(note: notes[index]);


          //   itemCount:
          //   BlocProvider
          //       .of<AddNoteCubit>(context)
          //       .index
          // ,
          // itemBuilder: (context, index) {
          // noteList.add(CustomNoteItem(
          // color: color,
          // i: BlocProvider.of<AddNoteCubit>(context).indx,
          // title: title!,
          // text: text!,
          // date: '22/04/2020',
          // ));
          // print(BlocProvider.of<AddNoteCubit>(context).indexo);
          // return noteList[index];
        });});
  }
}