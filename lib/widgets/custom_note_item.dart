import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  final List<NoteModel> noteModel;
  final int index;
  const CustomNoteItem({
    Key? key,
    required this.noteModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(
              noteModel: noteModel[index],
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(noteModel[index].color).withOpacity(.8)
            ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel[index].title,
                  style: Styles.textStyle25,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: Text(
                    noteModel[index].subTitle,
                    maxLines: 4,
                    style: Styles.textStyle20.copyWith(
                        color: Colors.black.withOpacity(.5), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.black.withOpacity(.7),
                  ),
                  onPressed: () {
                    noteModel[index].delete();
                    BlocProvider.of<NoteCubit>(context).fetchNote();
                    SnackBar snackBar = const SnackBar(
                      content: Text('Remove Note Successfuly'),
                      backgroundColor: kPrimaryColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  noteModel[index].date,
                  style: Styles.textStyle16
                      .copyWith(color: Colors.black.withOpacity(.3)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
