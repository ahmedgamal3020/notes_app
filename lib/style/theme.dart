
import 'package:flutter/material.dart';
import 'package:notes/style/color.dart';

 ThemeData defaultTheme = ThemeData(
   primarySwatch: defaultColor,
   fontFamily: 'Poppins',
   brightness: Brightness.dark,
   textTheme:const TextTheme(

   bodyText1: TextStyle(
    fontSize: 20,
   ),
   subtitle1: TextStyle(
    fontSize: 15
   )
  ),
   iconTheme: const IconThemeData(
   color: Colors.white,
  ),
   floatingActionButtonTheme:const  FloatingActionButtonThemeData(
       backgroundColor: defaultColor,
   )
 );