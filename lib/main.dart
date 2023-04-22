import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/note_edit_view.dart';
import 'package:note_app/views/notes_view_bottom_sheet.dart';


import 'costatnts/Constants.dart';
import 'cubits/home_page_cubit/addNote_cubit.dart';



void main() async{

  Bloc.observer=SimpleBlocObserver();
  /// we have to choose the hive comming from package (hive flutter) not from package (hive)
  await Hive.initFlutter();
  /// i have to tell hive to work with note model using hive.register
  Hive.registerAdapter(NoteModelAdapter());
  Hive.openBox<NoteModel>(kNotesBox);

  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme:ThemeData.dark() ,

   routes: {
     NotesViewBottomSheet.id: (context) =>  NotesViewBottomSheet(),
     NoteEditView.id: (context) =>  NoteEditView(),
   },
      initialRoute: NotesViewBottomSheet.id,
    );

  }
}
