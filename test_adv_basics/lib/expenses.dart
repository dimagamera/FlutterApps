import 'package:flutter/material.dart';
import 'package:test_adv_basics/add_item.dart';
import 'package:test_adv_basics/cards.dart';
import 'package:test_adv_basics/lists.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  final List<Expense> _registeredExpenses = [
    Expense(id: 'Id', title: 'Title')
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Additem(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Top NEWS',
          style: TextStyle(fontSize: 19),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Top News Today',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SizedBox(
              child: Cardsitem(expenses: _registeredExpenses),
            ),
          ),
        ],
      ),
    );
  }
}
