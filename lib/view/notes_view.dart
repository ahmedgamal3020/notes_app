import 'package:flutter/material.dart';
import 'package:notes/view/widgets/bottom_sheet.dart';
import 'package:notes/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        child:const  Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder:(context){
                return AddNoteInBottomSheet();
              }
          );
        },
      ),
    );
  }
}


