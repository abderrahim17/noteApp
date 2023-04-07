import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  CustomNoteItem({
    required this.i,
    required this.title,
    required this.text,
    required this.date,
    required this.color,
  });

  String title, text, date;

  List<Color> color = [];
  int i;

  @override
  Widget build(BuildContext context) {
    if (i > 6) {
      i = 0;
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          // showMaterialModalBottomSheet(
          //   context: context,
          //   builder: (context) => SingleChildScrollView(
          //     controller: ModalScrollController.of(context),
          //     child: Container(
          //       child: Text('hello'),
          //     ),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color[i]),
          height: MediaQuery.of(context).size.height / 4,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 15),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('27/1/2024'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
