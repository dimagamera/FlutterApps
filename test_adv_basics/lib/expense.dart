import 'package:flutter/material.dart';

enum ExpenseList {
  box,
  football,
  tenis, basketball,
}

class ExpensesC {
  ExpensesC({
    required this.expenselist,
    required this.title,
  });
  final ExpenseList expenselist;
  final String title;
}
