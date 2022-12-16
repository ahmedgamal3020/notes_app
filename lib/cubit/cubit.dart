import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/conponents/constants.dart';
import 'package:notes/cubit/states.dart';
import 'package:notes/models/note_model.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

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
  void addDate(NoteModel note)async{
    try {
      emit(AppAddDataLoadingState());
      var noteValue = Hive.box<NoteModel>(notesBox);
      await noteValue.add(note);
      emit(AppAddDataSuccessState());
    }catch(error){
      print(error.toString());
      emit(AppAddDataErrorState());
    }
  }
}