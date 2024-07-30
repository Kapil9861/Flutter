import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/presentation/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.onRemoveExpense, required this.expensesList});
  final List<Expense> expensesList;
  final Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ), //Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) => onRemoveExpense(expensesList[index]),
        key: ValueKey(expensesList[index]),
        child: ExpensesItem(
          expensesList[index],
        ),
      ), // INSTEAD OF THIS { Text(expensesList[index].title)} WE ARE PASSING INDIVIDUAL lIST
    );
  }
}
