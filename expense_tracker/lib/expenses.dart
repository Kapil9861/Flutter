import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });
  @override
  State createState() {
    return _ExpensesState(); // yo haina mula private constructor return hanney ho gadhey State<Expenses>;
  }
}

class _ExpensesState extends State<Expenses> {
  DateTime date = DateTime.now();
  final List<Expense> _registeredExpenses = [
    Expense(
      date: DateTime.now(),
      amount: 14.99,
      title: "Flutter Course",
      category: Category.work,
    ),
    Expense(
      date: DateTime.now(),
      amount: 21,
      title: "Movie",
      category: Category.leisure,
    )
  ];
  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Expenses"),
          Text("Widget 2"),
        ],
      ),
    );
  }
}
