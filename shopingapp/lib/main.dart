import 'package:flutter/material.dart';
import 'package:shopingapp/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      title: 'Shoping APP',
      home: const HomePage(),
    );
  }
}
