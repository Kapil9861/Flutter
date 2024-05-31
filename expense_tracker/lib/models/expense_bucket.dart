import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
