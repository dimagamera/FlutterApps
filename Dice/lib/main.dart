import 'package:flutter/material.dart';
import 'package:testapp/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: GradientContainer(
         Color.fromARGB(255, 146, 20, 210),
         Color.fromARGB(255, 136, 0, 255),
      ),
    ),
  ));
}
