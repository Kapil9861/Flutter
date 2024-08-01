part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class InitialExpenseEvent extends ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {}

class DeleteExpenseEvent extends ExpenseEvent {}

class EditExpenseEvent extends ExpenseEvent {}
