import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _currenctExpenses = [
    Expense(
      amount: 19.99,
      category: Category.leisure,
      title: 'Cinema',
      date: DateTime.now(),
    ),
    Expense(
      title: 'Tickets',
      amount: 30,
      date: DateTime.now(),
      category: Category.travel,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ExpenseTracker',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('asd'),
          Expanded(
            child: ExpensesList(exprenses: _currenctExpenses),
          ),
        ],
      ),
    );
  }
}
