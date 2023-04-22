import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/home_page_cubit/addNote_cubit.dart';

import 'package:note_app/views/note_vew_bottom_sheet.dart';

import '../widgets/Add_note_form.dart';
import '../widgets/custom_note_item.dart';

class NotesViewBottomSheet extends StatelessWidget {
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

  NotesViewBottomSheet

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView.builder(itemBuilder: (context, index)
    {
    //   itemCount:
    //   BlocProvider
    //       .of<AddNoteCubit>(context)
    //       .index
    // ,
    // itemBuilder: (context, index) {
    // noteList.add(CustomNoteItem(
    // color: color,
    // i: BlocProvider.of<AddNoteCubit>(context).indx,
    // title: title!,
    // text: text!,
    // date: '22/04/2020',
    // ));
    // print(BlocProvider.of<AddNoteCubit>(context).indexo);
    // return noteList[index];
    })


    );
  }

// BlocBuilder<HomeCubit, HomeState> NotesBody() {
//   return
// }
  }
