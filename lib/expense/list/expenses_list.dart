import 'package:flutter/material.dart';
import 'package:usertracker/expense/expense.dart';
import 'package:usertracker/expense/list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expense, required this.onRemoveExpense});

  final List<Expense> expense;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Colors.red,),
          onDismissed: (Direction)
           {
            onRemoveExpense(expense[index]);
          },
          key: ValueKey(expense[index]),
          child: ExpenseItem(expense[index])),
    );
  }
}
