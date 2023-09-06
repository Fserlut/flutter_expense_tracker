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

  void _removeExpense(Expense e) {
    final expenseIndedx = _currenctExpenses.indexOf(e);
    setState(() {
      _currenctExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('Expense name: "${e.title}" deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _currenctExpenses.insert(expenseIndedx, e);
              });
            }),
      ),
    );
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => CreateNewExpense(_addNewExpence),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = const Center(
      child: Text('No expenses found'),
    );

    if (_currenctExpenses.isNotEmpty) {
      currentWidget = ExpensesList(
        exprenses: _currenctExpenses,
        removeExpense: _removeExpense,
      );
    }
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
            child: currentWidget,
          ),
        ],
      ),
    );
  }
}
