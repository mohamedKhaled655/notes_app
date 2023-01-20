import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_list_colors.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding:  EdgeInsets.only(left: 20, right: 20, top: 5,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Add Note",
                style: Styles.textStyle20,
              ),
            ),
            CustomTextFeild(
              hint: "Title",
              onSave: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFeild(
              hint: "Contant",
              maxLine: 5,
              onSave: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
           const CustomListOfColors(),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<AddNoteCubit,AddNoteStates>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoadingState?true:false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate= DateTime.now();
                      var dateFormatted=DateFormat.yMd().format(currentDate);
                      NoteModel noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: dateFormatted,
                          color: Colors.blue.value
                      );

                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                       BlocProvider.of<NoteCubit>(context).fetchNote();

                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },

            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}



