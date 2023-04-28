import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_page_cubit/add_note_cubit.dart';
import '../cubits/read_note_cubit.dart';
import '../widgets/Add_note_form.dart';

class NoteViewBottomSheet extends StatelessWidget {
  const NoteViewBottomSheet({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddNoteCubit(),
                  child: BlocConsumer<AddNoteCubit,AddNoteState>(
                      listener:(context,state){
                        if (state is AddNoteSuccess){
                          Navigator.pop(context);
                         BlocProvider.of<ReadNoteCubit>(context).FetchNote();

                        }
                        if (state is AddNoteFailure){
                          debugPrint('fefz ${state.exeption }');

                        }

                      } ,
                      builder:(context,state){
                        ///absorb pointer is a function to bloc the user to interact with the screen
                        return AbsorbPointer(
                            absorbing: state is AddNoteLoadding ? true :false ,
                            child: SingleChildScrollView(child: AddNoteForm()));}),
                );
              });
        },
        child: const Icon(Icons.add, color: Colors.white));
  }
}