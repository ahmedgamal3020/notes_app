import 'package:flutter/material.dart';
import 'package:notes/view/widgets/note_item.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder:(context,index)=>NoteItem(),
          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount: 3
      ),
    );
  }
}


