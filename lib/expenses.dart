

import 'package:flutter/material.dart';

import 'package:usertracker/chart/chart.dart';
import 'package:usertracker/expense/list/addpage.dart';
import 'package:usertracker/expense/list/expenses_list.dart';
import 'package:usertracker/expense/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      name: 'petrol',
      amount: 22.3,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      name: 'MOVIE',
      amount: 22.3,
      date: DateTime.now(),
      category: Category.entertainment,
    )
  ];

  void plusbutton() {
    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddPage(
              onAddExpense: _addexpense,
            ));
  }

  void _addexpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeexpense(Expense expense) {
    final currentindex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("EXPENSE DELETED"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _registeredExpense.insert(currentindex, expense);
          });
        },
      ),
    ));
  }

  

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    Widget maincontent = const Center(
      child: Text("START ADDING YOUR EXPENSES"),
    );
    if (_registeredExpense.isNotEmpty) {
      maincontent = ExpensesList(
        expense: _registeredExpense,
        onRemoveExpense: _removeexpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'MY TRACKER',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            IconButton(onPressed: plusbutton, icon: const Icon(Icons.add))
          ],
        ),
        body:Width <600 ? Column(
          children: [
            Chart(expenses: _registeredExpense),
            Expanded(child: maincontent),
          ],
        ):Row(children: [
          Expanded(child:Chart(expenses: _registeredExpense),
        ),
    Expanded(child: maincontent),
        ],)
        )
        ;
  }
}
