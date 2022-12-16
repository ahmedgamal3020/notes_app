import 'package:flutter/material.dart';

class CustomIconBottomSearch extends StatelessWidget {
  const CustomIconBottomSearch({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16)
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon),iconSize: 24),
    );
  }
}
