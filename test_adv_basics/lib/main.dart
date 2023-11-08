import 'package:flutter/material.dart';
import 'package:test_adv_basics/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 18, 18, 18),
        ),
        backgroundColor: Colors.black26,
        body: const Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Expense list',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Expenses(), // Оберните виджет Expenses в Expanded
            ),
            SizedBox(
              height: 100,
            )
          ],
          
        ),
      ),
    );
  }
}
