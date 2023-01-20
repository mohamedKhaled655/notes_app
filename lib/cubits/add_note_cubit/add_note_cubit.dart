
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constans.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
 AddNoteCubit() : super(AddNoteInitialState());

  static AddNoteCubit get(context)=>BlocProvider.of(context);
  
  Color color=const Color(0xfff4a261);
  addNote(NoteModel note)async{
    emit(AddNoteLoadingState());
    note.color=color.value;
    try {
      var notesBox=Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      
      emit(AddNoteSuccessState());
    }  catch (e) {
      print("error=${e.toString()}");
      AddNoteFaliureState(e.toString());
    }
  } 


}