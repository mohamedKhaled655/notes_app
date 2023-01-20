import 'package:flutter/material.dart';

class CustomCircleColor extends StatelessWidget {
  final bool isActive;
  final Color color;
  const CustomCircleColor({
    Key? key,required this.isActive,required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive?CircleAvatar(
      radius: MediaQuery.of(context).size.height*.03,
      backgroundColor:Colors.white ,
      child: CircleAvatar(
      backgroundColor: color,
      radius: MediaQuery.of(context).size.height*.0275,
    ),
    ): CircleAvatar(
      backgroundColor: color,
      radius: MediaQuery.of(context).size.height*.03,
    );
  }
}