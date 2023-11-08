import 'package:flutter/material.dart';
import 'package:test_adv_basics/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<ExpensesC> exp = [
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    ExpensesC(expenselist: ExpenseList.basketball, title: 'Football'),
    // Добавьте другие элементы в список exp по мере необходимости
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = screenHeight * 0.15;

    return ListView.separated(
      itemCount: exp.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10); // Отступ между карточками
      },
      itemBuilder: (BuildContext context, int index) {
        if (index < exp.length) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    title: Column(
                      children: [
                        Center(
                          child: Text(
                            exp[index].title,
                            style: TextStyle(fontSize: screenHeight * 0.025),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    subtitle: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '${exp[index].expenselist.name}',
                              style: TextStyle(fontSize: screenHeight * 0.02),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.sports_football, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const ListTile(
            title: Text('Invalid Index'),
          );
        }
      },
    );
  }
}
