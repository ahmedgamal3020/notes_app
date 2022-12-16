import 'package:flutter/material.dart';
import 'package:notes/view/widgets/app_bar.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children:const [
            SizedBox(
              height: 50,
            ),
            CustomAppBar()
          ],
        ),
      ),
    );
  }
}


