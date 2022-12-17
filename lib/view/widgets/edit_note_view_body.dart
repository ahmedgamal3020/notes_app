import 'package:flutter/material.dart';
import 'package:notes/cubit/notes/cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/view/widgets/app_bar.dart';
import 'package:notes/view/widgets/list_item_color.dart';
import 'package:notes/view/widgets/text_field.dart';

import '../../conponents/constants.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final  NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}
class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
                CustomAppBar(
                    onPressed:(){
                      widget.note.title =title??widget.note.title;
                      widget.note.subTitle =subTitle??widget.note.subTitle;
                      widget.note.save();
                      NotesCubit.get(context).getNotes();
                      Navigator.pop(context);
                    },
                    title: 'Edit NOte',
                    icon:Icons.check

              ),
              const SizedBox(height: 15),
              CustomTextField(
                onChanged: (value){
                  title=value;

                },

                hint: 'Title',
              ),
              const SizedBox(height: 15,),
              CustomTextField(
                onChanged: (value){
                  subTitle =value;
                },
                hint: 'Content',
                maxLines: 5,
              ),
              const SizedBox(height: 15),
              EditNoteColorList(note: widget.note,)



            ],
          ),
        );

  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex=colors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                    currentIndex=index;
                    widget.note.color=colors[index].value;
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

