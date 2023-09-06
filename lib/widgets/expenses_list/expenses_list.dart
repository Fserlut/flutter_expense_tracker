import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.exprenses, required this.removeExpense});

  final List<Expense> exprenses;
  final void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exprenses.length,
      itemBuilder: (ctx, idx) => Dismissible(
        onDismissed: (d) {
          removeExpense(exprenses[idx]);
        },
        key: ValueKey(exprenses[idx].id),
        child: ExpenseItem(exprenses[idx]),
      ),
    );
  }
}
