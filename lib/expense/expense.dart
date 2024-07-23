import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, job, travel, entertainment }

const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.entertainment: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.job: Icons.work
};

class Expense {
  Expense(
      {required this.name,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

ExpenseBucket.forCategory(List<Expense> allExpenses, this.category ): expenses = allExpenses.where((expense) => expense.category == category).toList();
  final List<Expense> expenses;
  final Category category;

  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
