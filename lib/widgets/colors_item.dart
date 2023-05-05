import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/cubits/home_page_cubit/add_note_cubit.dart';

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
              BlocProvider.of<AddNoteCubit>(context).color=kColor[index];
              // debugPrint('$currentindex');
              // debugPrint('$index');
setState(() {});
            },
            child: ColorsItem(isPicked: currentindex ==index ,
              color:kColor [index ],
            ),
          ),
        );
    } ),
      );
  }
}
