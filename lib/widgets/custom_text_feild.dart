import 'package:flutter/material.dart';
import 'package:notes_app/utils/constans.dart';

class CustomTextFeild extends StatelessWidget {
  final String hint;
  final int maxLine;
  final String text;
  final void Function(String?)? onSave;
  final Function(String)?onChange;
  const CustomTextFeild({
    Key? key,required this.hint, this.maxLine=1, this.onSave, this.onChange, this.text="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: text,
      onChanged: onChange,
      onSaved: onSave,
      validator: (value){
        if(value?.isEmpty ??true){
          return "Field is required";
        }else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLine,
     decoration: InputDecoration(
      hintText: hint,
      
      hintStyle: Styles.textStyle16.copyWith(color: kPrimaryColor.withOpacity(.7)),
       border: buildBorder(),
       enabledBorder: buildBorder(),
       focusedBorder: buildBorder(kPrimaryColor),
     ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
       borderRadius: BorderRadius.circular(16),
       borderSide: BorderSide(color:Color?? Colors.white)
     );
  }
}