import 'package:expense_tracker/presentation/widgets/chart/chart.dart';
import 'package:expense_tracker/presentation/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/presentation/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void _addExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(addExpense: _onAddExpenses),
    );
  }

  void _onAddExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _onRemoveExpenses(Expense expense) {
    int expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Expense Deleted!",
          style: GoogleFonts.lato(fontSize: 16),
        ),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          }),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final backgroundWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expenses"),
        actions: [
          IconButton(
            onPressed: _addExpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: backgroundWidth < 600
          ? Column(
              children: [
                (_registeredExpenses.isNotEmpty)
                    ? Chart(expenses: _registeredExpenses)
                    : Center(
                        heightFactor: 4,
                        child: Text(
                          "No expenses Found!\n Please Add Some!",
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                      ),
                Expanded(
                  child: (_registeredExpenses.isNotEmpty)
                      ? ExpensesList(
                          expensesList: _registeredExpenses,
                          onRemoveExpense: _onRemoveExpenses)
                      : const Text(""),
                ),
              ],
            )
          : Row(
              children: [
                (_registeredExpenses.isNotEmpty)
                    ? Expanded(child: Chart(expenses: _registeredExpenses))
                    : Center(
                        heightFactor: 4,
                        child: Text(
                          "No expenses Found!\n Please Add Some!",
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                      ),
                Expanded(
                  child: (_registeredExpenses.isNotEmpty)
                      ? ExpensesList(
                          expensesList: _registeredExpenses,
                          onRemoveExpense: _onRemoveExpenses)
                      : const Text(""),
                ),
              ],
            ),
    );
  }
}
