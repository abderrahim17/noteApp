import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/home_page_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/read_note_cubit.dart';

import 'package:note_app/views/note_vew_bottom_sheet.dart';

import '../widgets/Add_note_form.dart';
import '../widgets/custom_note_item.dart';
import 'notes_list_view.dart';

class NotesView extends StatelessWidget {
  static String id = 'HomePage';

  late List<Widget> noteList = [];

  List<Color> color = [
    Colors.green,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.lightBlue,
    Colors.lightGreen
  ];

  NotesView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ReadNoteCubit(),
        child: Scaffold(
          floatingActionButton: NoteViewBottomSheet(),
          appBar: AppBar(
            title: Row(
              children: [
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20.0),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  ),
                )
              ],
            ),
          ),


          body:NotesListView()


        )


    );
  }

// BlocBuilder<HomeCubit, HomeState> NotesBody() {
//   return
// }
}

