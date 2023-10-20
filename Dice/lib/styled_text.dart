import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
   StyledText(this.text ,{super.key});
  final String text;
  
  @override
  Widget build(context) {
    return Text(
      text,
      style:  TextStyle(
          color: Color.fromARGB(255, 120, 139, 103), fontSize: 35, fontWeight: FontWeight.bold),
    );
  }
}
