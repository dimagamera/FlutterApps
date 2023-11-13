import 'package:flutter/material.dart';
import 'package:test_adv_basics/lists.dart';
import 'package:test_adv_basics/wiver.dart';

class Cardsitem extends StatelessWidget {
  const Cardsitem({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext ctx, int index) =>
          Viewer(expense: expenses[index]),
    );
  }
}
