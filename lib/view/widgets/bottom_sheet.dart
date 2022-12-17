import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/add_notes_cubit/cubit.dart';
import 'package:notes/cubit/add_notes_cubit/states.dart';
import 'package:notes/cubit/notes/cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/view/widgets/button.dart';
import 'package:notes/view/widgets/list_item_color.dart';
import 'package:notes/view/widgets/text_field.dart';

class AddNoteInBottomSheet extends StatelessWidget {
  const AddNoteInBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AppAddDataSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          String? title;
          String? subTitle;
          AddNoteCubit cubit = AddNoteCubit.get(context);
          return AbsorbPointer(
            absorbing: state is AppAddDataLoadingState?true:false,
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autoValidateMode,
              child: Padding(
                padding:  EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (value) {
                          title = value;
                        },
                        hint: 'Title',

                      ),
                      const SizedBox(height: 12,),
                      CustomTextField(
                        onSaved: (value) {
                          subTitle = value;
                        },
                        maxLines: 5,
                        hint: 'Content',

                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListViewItemColor(),
                      state is AppAddDataLoadingState?const  CircularProgressIndicator():CustomButton(
                        width: double.infinity,
                        text: 'Add',
                        onPressed: () {
                          cubit.validate();
                          var time =DateTime.now();
                          var styleTime=DateFormat.yMd().format(time);
                          NoteModel model = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: styleTime,
                              color: Colors.deepOrange.value
                          );
                          cubit.addData(model);
                          NotesCubit.get(context).getNotes();
                          listViewController.animateTo(
                              listViewController.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



