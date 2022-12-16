import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/cubit/cubit.dart';
import 'package:notes/cubit/states.dart';
import 'package:notes/view/widgets/button.dart';
import 'package:notes/view/widgets/text_field.dart';

class AddNoteInBottomSheet extends StatelessWidget {
 const AddNoteInBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is AppAddDataSuccessState){
          Navigator.pop(context);
        }

      },
      builder: (context, state) {
        AppCubit cubit =AppCubit.get(context);
        return ModalProgressHUD(
          inAsyncCall:state is AppAddDataLoadingState?true:false,
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
                      onSaved: (value){},
                      hint: 'Title',

                    ),
                    const SizedBox(height: 12,),
                    CustomTextField(
                      onSaved: (value){},
                      maxLines: 5,
                      hint: 'Content',

                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      width: double.infinity,
                      text: 'Add',
                      onPressed: () {
                       cubit.validate();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


