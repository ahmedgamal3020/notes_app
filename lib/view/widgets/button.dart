import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.width, required this.text, this.onPressed, this.color=Colors.white}) : super(key: key);
  final double width;
  final String text;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text,
            style: TextStyle(color:color),)
      ),
    );
  }
}
