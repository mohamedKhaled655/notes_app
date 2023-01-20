import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/widgets/custon_circle_color.dart';

class CustomListOfColors extends StatefulWidget {
  const CustomListOfColors({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomListOfColors> createState() => _CustomListOfColorsState();
}

class _CustomListOfColorsState extends State<CustomListOfColors> {
  int currentIndex=0;
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
              BlocProvider.of<AddNoteCubit>(context).color=colors[index];
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
