
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/textField_Custom.dart';

import '../cubits/home_page_cubit/addNote_cubit.dart';

class AddNoteForm extends StatefulWidget {
   AddNoteForm({
  super.key,
  });


  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

String? text, title;
GlobalKey<FormState> FormKey =GlobalKey();
AutovalidateMode Autovalidate =AutovalidateMode.disabled;
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
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              maxlines: 8,
              hint: 'Contain',
              onsaved: (data) {
                text = data;
              }),
          SizedBox(height: 15),
          ElevatedButton(

              onPressed: () {
if (FormKey.currentState!.validate()){
  FormKey.currentState!.save();
}else{Autovalidate=AutovalidateMode.always;}
                Navigator.pop(context);
                //BlocProvider.of<HomeCubit>(context).add_button();
              },
              child: const Text('Done'))
        ],
      ),
    );
  }
}