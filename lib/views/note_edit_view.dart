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
appBar: AppBar(title: Row(
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
            onPressed: () {}, icon: const Icon(Icons.done)),
      ),
    )
  ],
),),
      body:
        SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0,right: 15,left: 15),
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
        ),
    )
  );
  }
}
