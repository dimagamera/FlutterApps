import 'package:flutter/material.dart';
import 'package:randomizer/body_main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Truth or action?',
          style: TextStyle(
            fontSize: 25, color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 223, 186),
      ),
      body: const MyBody(),
    ),
  ));
}
