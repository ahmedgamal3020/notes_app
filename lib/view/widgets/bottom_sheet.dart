import 'package:flutter/material.dart';
import 'package:notes/view/widgets/button.dart';
import 'package:notes/view/widgets/text_field.dart';

class AddNoteInBottomSheet extends StatelessWidget {
  const AddNoteInBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10
      ),
      child: Column(
        children: [
          CustomTextField(hint: 'Title',),
          const SizedBox(height: 12,),
          CustomTextField(maxLines: 5,hint: 'Content',),
          const Spacer(),
          CustomButton(
            width:double.infinity,
            text: 'Add',
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}


