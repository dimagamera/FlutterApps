import 'package:flutter/material.dart';
import 'package:treckerapp/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '${expense.amount.toStringAsFixed(2)}\$',
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(expense.formattedDate),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(categoryIcons[expense.category]),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
