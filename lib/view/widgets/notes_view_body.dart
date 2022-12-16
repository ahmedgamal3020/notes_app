import 'package:flutter/material.dart';
import 'package:notes/view/widgets/app_bar.dart';
import 'package:notes/view/widgets/list_view_spreted.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          SizedBox(
            height: 10,),
          ListViewSeparated(),
        ],
      ),
    );
  }
}
