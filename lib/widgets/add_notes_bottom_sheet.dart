import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNotBottomSheet extends StatelessWidget {
  const AddNotBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is AddNoteSuccessState) {
              SnackBar   snackBar =  const SnackBar(
                content: Text('Add Note Successfuly'),
                backgroundColor: kPrimaryColor,
               
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.of(context).pop();
            } else if (state is AddNoteFaliureState) {
              print("error state =${state.message}");
            }
          },
          builder: (context, state) {
            if (state is AddNoteFaliureState) {
              return Center(
                child: Text(
                  state.message,
                  maxLines: 3,
                ),
              );
            } else {
              return Column(
                children: [
                  (state is AddNoteLoadingState)
                      ? const LinearProgressIndicator()
                      : Container(),
                  AbsorbPointer(
                    absorbing: state is AddNoteLoadingState ? true : false,
                    child: const AddNoteForm(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
