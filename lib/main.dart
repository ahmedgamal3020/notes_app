import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/notes/cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/style/theme.dart';
import 'package:notes/view/notes_view.dart';

void main() async {
  FlutterErrorDetails.propertiesTransformers;
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..getNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: const NotesView(),
      ),
    );
  }
}



