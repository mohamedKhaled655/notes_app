import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/widgets/add_notes_bottom_sheet.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:const NotesView(),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add,),
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
          context: context, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            ),
          builder: (context){
            return const AddNotBottomSheet();
          });
        }
        ),
    );
  }
}

