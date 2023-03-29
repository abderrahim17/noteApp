import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/home_page_cubit/home_cubit.dart';
import 'package:note_app/widgets/textField_Custom.dart';

import '../widgets/custom_note_item.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  int indx = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          // Center(
          //   child: Container(
          //   width: MediaQuery.of(context).size.width / 2,
          //   child:
          //   CustomTextForm_Field(hint: 'what are you searching for..?',
          //       clr1: Colors.white,
          //       clr2: Colors.white38)),
          // ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          )
        ],
      ),
      body: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
        BlocBuilder<HomeCubit,HomeState>(
          builder:(context , state){ return ListView.builder(
              itemCount: indx,
              itemBuilder: (context, index) {
                return CustomNoteItem(
                  i: indx,
                  title: 'njn',
                  text: 'k,kr',
                  date: '22/04/2020',
                );
              });}

        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(onPressed: () {
            indx = indx + 1;
            print(indx);

          }),
        )
      ]),
    );
  }
}
