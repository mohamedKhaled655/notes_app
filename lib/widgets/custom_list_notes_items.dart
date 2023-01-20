import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';

import 'custom_note_item.dart';

class CustomListNotesItems extends StatelessWidget {
  const CustomListNotesItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit,NotesStates>(
      builder: (context, state) {
         var cubit=NoteCubit.get(context);

        return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child:  CustomNoteItem(noteModel: cubit.notes.reversed.toList(),index: index),
            );
          },
           
            itemCount: state is NotesSuccessState? cubit.notes.reversed.length:0,
            ),
      );
      },
    );
  }
}