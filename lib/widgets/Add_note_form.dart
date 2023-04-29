import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/widgets/colors_item.dart';

import 'package:note_app/widgets/textField_Custom.dart';

import 'package:note_app/widgets/validation_button.dart';


class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    //required this.isloading,
    super.key,
  });
//bool isloading;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

String? text, title;

GlobalKey<FormState> FormKey = GlobalKey();
/// AutoValidateMode is to show the red sign that you have to write something on the field
AutovalidateMode Autovalidate = AutovalidateMode.disabled;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKey,
      autovalidateMode: Autovalidate,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Title',
            onsaved: (data) {
              title = data;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              maxlines: 8,
              hint: 'Contain',
              onsaved: (data) {
                text = data;
              },  ),
          const SizedBox(height: 15),
          const ColorsListView(),
          const ValidationButton()
        ],
      ),
    );
  }
}

