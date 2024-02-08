import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});
  final List<Expense> expensesList;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => ExpensesItem(
        expensesList[index],
      ), // INSTEAD OF THIS { Text(expensesList[index].title)} WE ARE PASSING INDIVIDUAL lIST
    );
  }
}
