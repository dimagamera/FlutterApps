import 'package:flutter/material.dart';
import 'package:test_adv_basics/lists.dart';

class Viewer extends StatelessWidget {
  const Viewer({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.green,
        child: SizedBox(
          height: 90,
          width: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                expense.title,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              // const Text(
              //   'Context',
              //   style: TextStyle(fontSize: 20, color: Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
