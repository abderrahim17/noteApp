import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/notes_view.dart';


import 'cubits/home_page_cubit/home_cubit.dart';



void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),

      ],

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        theme:ThemeData.dark() ,

   routes: {
     NotesView.id: (context) =>  NotesView(),
   },
        initialRoute: NotesView.id,
      ),
    );

  }
}
