import 'package:flutter/material.dart';
import 'package:notes/view/widgets/app_bar.dart';
import 'package:notes/view/widgets/text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

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
                onPressed:(){},
                title: 'Edit NOte',
                icon:Icons.check

          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: 'Title',
          ),
          const SizedBox(height: 12,),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
          ),

        ],
      ),
    );
  }
}
