
import 'package:flutter/material.dart';
import 'package:notes_app/utils/constans.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final Icon icon;
  final String title;
  final void Function()? onPress;
  const CustomAppBar({
    Key? key,required this.icon,required this.title, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        style: Styles.textStyle30,),
        CustomSearchIcon(
          icon:icon,
          function: onPress,
        ),
      ],
    );
  }
}