import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/widgets/textField_Custom.dart';

class HomePage extends StatelessWidget {

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Notes', style: TextStyle(fontSize: 20,),),
            iconTheme: IconThemeData.fallback(),

            actions: [
        Center(
          child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child:
          CustomTextForm_Field(hint: 'what are you searching for..?',
              clr1: Colors.white,
              clr2: Colors.white38)),
        ),
        Padding(
    padding: const EdgeInsets.only(left:20,right: 20.0),
    child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
    )
    ]
    ,
    )
    ,
    );
  }
}
