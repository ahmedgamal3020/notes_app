import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notes/view/widgets/bottom_sheet.dart';
import 'package:notes/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: NotesViewBody(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add, color: Colors.white,),
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          topLeft: Radius.circular(18),
                        )
                    ),
                    context: context,
                    builder: (context) {
                      return AddNoteInBottomSheet();
                    },
                 routeSettings: RouteSettings(arguments:debugEnhanceLayoutTimelineArguments )
                );
              },
            ),
          );

  }
}


