import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/notes/cubit.dart';
import 'package:notes/cubit/notes/states.dart';
import 'package:notes/view/widgets/note_item.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListView.separated(
              controller: listViewController,
              physics:const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => NoteItem(model: NotesCubit.get(context).model[index]),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10,),
                itemCount: NotesCubit.get(context).model.length
            ),
          ),
        );
      },
    );
  }
}


