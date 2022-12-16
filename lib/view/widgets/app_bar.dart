import 'package:flutter/material.dart';
import 'package:notes/view/widgets/search_iconBottom.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon,this.onPressed}) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
          style:const TextStyle(
              fontSize: 20
          ),
        ),
        const Spacer(),
        CustomIconBottomSearch(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
