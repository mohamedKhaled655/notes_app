import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  final Icon icon;
  final Function()? function;
  const CustomSearchIcon({
    Key? key,required this.icon, this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
      ),
      child: IconButton(
        icon:icon,
        onPressed: function,
      ),
    );
  }
}