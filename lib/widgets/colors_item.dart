import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({Key? key, required this.isPicked, required this.color }) : super(key: key);
 final bool isPicked ;

  final Color color ;



  @override
  Widget build(BuildContext context) {
    return isPicked ? CircleAvatar(
 radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
radius: 30,
        backgroundColor: color,
      ),
    ): CircleAvatar(
        radius: 38,
        backgroundColor: color,);
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
   int? currentindex=0;
   List<Color> color = const  [
     Colors.green,
     Colors.lightBlueAccent,
     Colors.cyanAccent,
     Colors.greenAccent,
     Colors.lightBlue,
     Colors.lightGreen
   ];

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height:38*2 ,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
          child: GestureDetector(
            onTap: (){
              currentindex =index ;
              debugPrint('$currentindex');
              debugPrint('$index');
setState(() {});
            },
            child: ColorsItem(isPicked: currentindex ==index ,
              color:color [index ],
            ),
          ),
        );
    } ),
      );
  }
}
