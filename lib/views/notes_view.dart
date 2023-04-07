import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/home_page_cubit/home_cubit.dart';
import 'package:note_app/widgets/textField_Custom.dart';

import '../widgets/custom_note_item.dart';

class NotesView extends StatelessWidget {
  static String id = 'HomePage';
  String? text, title;
  late List<Widget> noteList = [];

  List<Color> color = [
    Colors.green,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.lightBlue,
    Colors.lightGreen
  ];

  NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
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
                              BlocProvider.of<HomeCubit>(context).add_button();
                            },
                            child: const Text('Done'))
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.add, color: Colors.white)),
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
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return ListView.builder(
            itemCount: BlocProvider.of<HomeCubit>(context).index,
            itemBuilder: (context, index) {
              noteList.add(CustomNoteItem(
                color: color,
                i: BlocProvider.of<HomeCubit>(context).indx,
                title: title!,
                text: text!,
                date: '22/04/2020',
              ));
              print(BlocProvider.of<HomeCubit>(context).indexo);
              return noteList[index];
            });
      }),
    );
  }

// BlocBuilder<HomeCubit, HomeState> NotesBody() {
//   return
// }
}
