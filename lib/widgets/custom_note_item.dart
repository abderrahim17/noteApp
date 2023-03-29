import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  CustomNoteItem(
      {required this.i,
      required this.title,
      required this.text,
      required this.date});

  String title, text, date;

  List<Color> color = [
    Colors.green,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.lightBlue,
    Colors.lightGreen
  ];
  int i;

  @override
  Widget build(BuildContext context) {
    if (i>6){i=0;}
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {},
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
                        'data',
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Text(
                          'data rRadius.circular(20),color: Colors.black12),height: MediaQuery.of(context).size.height/4,',
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
