import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/widgets/custon_circle_color.dart';

class EditNoteColorList extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteColorList({
    Key? key,required this.noteModel,
  }) : super(key: key);

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
 late int currentIndex;
  
  @override
  void initState() {
    currentIndex=colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height*.06,
      child: ListView.builder(
        scrollDirection:Axis.horizontal ,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child:  GestureDetector(
            
            child: CustomCircleColor(isActive:currentIndex==index? true:false,color:colors[index] ),onTap: (){
              currentIndex=index;
              widget.noteModel.color=colors[index].value;
              setState(() {
                
              });
            },
            ),
        ),
        itemCount: colors.length,
      ),
    );
  }
}
