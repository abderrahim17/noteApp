import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubits/home_page_cubit/add_note_cubit.dart';
import '../widgets/textField_Custom.dart';

class NoteEditView extends StatelessWidget {
  NoteEditView({Key? key}) : super(key: key);
String? text,title;
static String  id ='NoteEditView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
        SingleChildScrollView(
        child: Column(
        children: [
        CustomTextField(
        hint: 'Title',
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
    SizedBox(height: 15),
    ElevatedButton(
    onPressed: () {
    Navigator.pop(context);

    },
    child: const Text('Done'))
    ],
    ),
    )
  );
  }
}
