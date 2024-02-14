import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});
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
