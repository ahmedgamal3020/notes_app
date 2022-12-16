import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_notes_cubit/cubit.dart';
import 'package:notes/cubit/add_notes_cubit/states.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/view/widgets/button.dart';
import 'package:notes/view/widgets/text_field.dart';

class AddNoteInBottomSheet extends StatelessWidget {
  const AddNoteInBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppAddDataSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          String? title;
          String? subTitle;
          AppCubit cubit = AppCubit.get(context);
          return AbsorbPointer(
            absorbing: state is AppAddDataLoadingState?true:false,
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10
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
                      state is AppAddDataLoadingState?const  CircularProgressIndicator():CustomButton(
                        width: double.infinity,
                        text: 'Add',
                        onPressed: () {
                          cubit.validate();
                          NoteModel model = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: DateTime.now().toString(),
                              color: Colors.deepOrange.value
                          );
                          cubit.addData(model);
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


