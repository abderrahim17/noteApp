import 'package:flutter/material.dart';
import 'package:note_app/Screens/home_page.dart';

void main() {
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
     HomePage.id: (context) =>  HomePage(),
   },
      initialRoute: HomePage.id,
    );

  }
}
