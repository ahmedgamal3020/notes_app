import 'package:flutter/material.dart';
import 'package:notes/view/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const  [
        Text('Notes',
          style: TextStyle(
              fontSize: 20
          ),
        ),
        Spacer(),
        CustomIconSearch()
      ],
    );
  }
}
