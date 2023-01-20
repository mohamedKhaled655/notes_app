import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/utils/constans.dart';

import '../../models/note_model.dart';

class NoteCubit extends Cubit<NotesStates> {
 NoteCubit() : super(NotesInitialState());

  static NoteCubit get(context)=>BlocProvider.of(context);
  
  List<NoteModel>notes=[];
  fetchNote()async{
   var notesBox=Hive.box<NoteModel>(kNotesBox);
      
   notes=notesBox.values.toList();   
   print("notes=$notes");
   emit(NotesSuccessState());
  } 


}