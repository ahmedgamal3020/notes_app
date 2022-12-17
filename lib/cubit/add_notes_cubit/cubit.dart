import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/add_notes_cubit/states.dart';
import 'package:notes/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit():super(AppInitialState());

  static AddNoteCubit get(context)=>BlocProvider.of(context);

  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey =GlobalKey();
  void validate(){
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    else {
      autoValidateMode=AutovalidateMode.always;

    }

  }
  Color color = const Color(0xffE76E0B);
  void addData(NoteModel note)async{

    note.color=color.value;
    emit(AppAddDataLoadingState());
    try {

      var noteValue = Hive.box<NoteModel>(notesBox);
      await noteValue.add(note);
      emit(AppAddDataSuccessState());
    }catch(error){
      print(error.toString());
      emit(AppAddDataErrorState());
    }
  }
}