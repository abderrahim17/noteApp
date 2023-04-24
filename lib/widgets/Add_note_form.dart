import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/textField_Custom.dart';
import 'package:intl/intl.dart';
import '../cubits/home_page_cubit/add_note_cubit.dart';

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
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    FormKey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                        title: title!,
                        date:DateFormat('dd-mm-yyyy').format(DateTime.now()),
                        subtitle: text!,
                        color: Colors.grey.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    Autovalidate = AutovalidateMode.always;
                  }
                  // Navigator.pop(context);
                  //BlocProvider.of<HomeCubit>(context).add_button();
                },
                child: state is AddNoteLoadding
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(
                          color: Colors.black54,
                        ))
                    : const Text('Done'));
          })
        ],
      ),
    );
  }
}
