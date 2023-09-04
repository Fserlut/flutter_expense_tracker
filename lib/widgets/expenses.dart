import 'package:expense_tracker_app/widgets/create_nex_expense.dart';
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

  void _addNewExpence(Expense e) {
    setState(() {
      _currenctExpenses.add(e);
    });
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => CreateNewExpense(_addNewExpence),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ExpenseTracker',
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
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
