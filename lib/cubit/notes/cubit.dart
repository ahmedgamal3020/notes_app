import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/notes/states.dart';
import 'package:notes/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates>{
  NotesCubit():super(NotesInitialState());

  static NotesCubit get(context)=>BlocProvider.of(context);

  List<NoteModel>model=[];
  void getNotes()async{
      var noteValue = Hive.box<NoteModel>(notesBox);
      model= noteValue.values.toList();
      emit(NotesAddDataSuccessState());
    }
  }
