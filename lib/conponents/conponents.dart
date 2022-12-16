
import 'package:flutter/material.dart';

Future<dynamic> navigateTo({required context, required Widget view})=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>view
    ));