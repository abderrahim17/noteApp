import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/note_edit_view.dart';
import 'package:note_app/views/notes_view.dart';
import 'constants/constants.dart';
import 'cubits/read_note_cubit.dart';



void main() async{

  Bloc.observer=SimpleBlocObserver();
  /// we have to choose the hive comming from package (hive flutter) not from package (hive)
  await Hive.initFlutter();

  /// i have to tell hive to work with note model using hive.register
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return BlocProvider(


    create: (context) => ReadNoteCubit(),
      child: MaterialApp(

      debugShowCheckedModeBanner: false,
        theme:ThemeData.dark() ,

   routes: {
       NotesView.id: (context) =>  NotesView(),
       //NoteEditView.id: (context) =>  NoteEditView(),
   },
        initialRoute: NotesView.id,
      ),
    );

  }
}
