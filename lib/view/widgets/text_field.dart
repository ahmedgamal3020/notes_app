import 'package:flutter/material.dart';
import 'package:notes/style/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint,  this.maxLines=1, this.onSaved}) : super(key: key);
  final String hint;
  final int  maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved: onSaved,
      validator: (String?value){
        if(value!.isEmpty){
          return 'can not be empty';
        }
        return null;
      },
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          border: buildBorder(color: defaultColor),
          enabledBorder:  buildBorder()
      ),

    );
  }
  OutlineInputBorder buildBorder({color}){
    return OutlineInputBorder(
        borderSide:  BorderSide(
            color:color??Colors.white,
            width: 2
        ),
        borderRadius: BorderRadius.circular(8)
    );
  }
}
