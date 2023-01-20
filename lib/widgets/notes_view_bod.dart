import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

import 'custom_list_notes_items.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
          children: [
            CustomAppBar(
              icon: const Icon(Icons.search),
              title: "Notes",
              onPress: (){
             
              },
            ),
            
           const Expanded(child: CustomListNotesItems()),
          ],
        ),
      ),
    );
  }
}



