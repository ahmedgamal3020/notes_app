import 'package:flutter/material.dart';
import 'package:notes/view/widgets/app_bar.dart';
import 'package:notes/view/widgets/list_view_spreted.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const CustomAppBar(),
            const SizedBox(
              height: 10,),
            const ListViewSeparated(),
          ],
        ),
      ),
    );
  }
}


