import 'package:flutter/material.dart';
import 'package:test_adv_basics/lists.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key, required this.onAddExpense}) : super(key: key);

  final void Function(Expense expense) onAddExpense;
  @override
  State<StatefulWidget> createState() {
    return _AdditemState();
  }
}

class _AdditemState extends State<Additem> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    if (_nameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Alert'),
          content: const Text('Context A'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(id: 'Id', title: _nameController.text),
    );
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Enter name'),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: _submitExpenseData,
                child: const Text('Save'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
