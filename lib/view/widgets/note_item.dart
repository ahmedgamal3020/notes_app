import 'package:flutter/material.dart';
import 'package:notes/conponents/conponents.dart';
import 'package:notes/cubit/notes/cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.model}) : super(key: key);
  final NoteModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(
          context: context,
          view: EditNoteView(note: model,)
        );
      },
      child: Container(
        padding:const  EdgeInsets.only(top: 20,bottom: 20,left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(model.color),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:Text(model.title,
                style:Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black
                ) ,),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(model.subTitle,
                    style:Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black.withOpacity(.5)
                ) ,),
              ),
              trailing: IconButton(
                  onPressed: (){
                    model.delete();
                    NotesCubit.get(context).getNotes();
                  },
                  icon:const  Icon(Icons.delete,
                  color: Colors.black,
                  size: 24,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(model.date,
                style:TextStyle(
                   color: Colors.black.withOpacity(.5)
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}