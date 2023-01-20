import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';
import 'package:notes_app/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteViewBody({Key? key, required this.noteModel}) : super(key: key);

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      child: ListView(
        children: [
          CustomAppBar(
            icon: const Icon(Icons.check),
            title: "Edit Note",
            onPress: () {
              widget.noteModel.title=title??widget.noteModel.title;
              widget.noteModel.subTitle=subTitle??widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NoteCubit>(context).fetchNote();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 50,
          ),
           CustomTextFeild(
            hint: "Title",
            text:widget.noteModel.title ,
            maxLine: 2,
            onChange: (value){
              title=value;
            },
            ),
          const SizedBox(
            height: 16,
          ),
           CustomTextFeild(
            hint: "Contant",
            text:widget.noteModel.subTitle ,
            onChange: (value){
              subTitle=value;
            },
            maxLine:15,
          ),
          const SizedBox(
            height: 16,
          ),
           EditNoteColorList(noteModel:widget.noteModel ),
        ],
      ),
    );
  }
}
