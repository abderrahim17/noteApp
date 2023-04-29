import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/home_page_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'Add_note_form.dart';

class ValidationButton extends StatelessWidget {
  const ValidationButton({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
      return ElevatedButton(
          onPressed: () {
            if (FormKey.currentState!.validate()) {
              FormKey.currentState!.save();
              NoteModel noteModel = NoteModel(
                  title: title!,
                  date:DateFormat('dd-MM-yyyy').format(DateTime.now()),
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
              ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.black54,
              ))
              : const Text('Done'));
    });
  }
}
