import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel noteModel;
  const EditNoteView({ Key? key,required this.noteModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(child: EditNoteViewBody(noteModel: noteModel,)),
    );
  }
}