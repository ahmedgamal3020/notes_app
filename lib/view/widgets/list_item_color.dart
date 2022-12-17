import 'package:flutter/material.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/add_notes_cubit/cubit.dart';
class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, this.color}) : super(key: key);
  final bool isActive;
  final color;
  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      radius: 25,
      backgroundColor:Colors.green ,
      child:CircleAvatar(
        radius: 23,
        backgroundColor: color,
      )
    ):CircleAvatar(
      radius: 23,
      backgroundColor: color,
    );
  }
}

class ListViewItemColor extends StatefulWidget {
  const ListViewItemColor({Key? key}) : super(key: key);

  @override
  State<ListViewItemColor> createState() => _ListViewItemColorState();
}

class _ListViewItemColorState extends State<ListViewItemColor> {
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection:Axis.horizontal ,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                setState((){
                  AddNoteCubit.get(context).color=colors[index];
                  currentIndex=index;
                });
              },
                child: ColorItem(isActive: currentIndex==index,color: colors[index],));
          },
          separatorBuilder:(context, index) =>const  SizedBox( width: 6,),
          itemCount:colors.length,
        )
    );
  }
}
