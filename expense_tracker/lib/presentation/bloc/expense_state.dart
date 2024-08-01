part of 'expense_bloc.dart';

@immutable
sealed class ExpenseState {}

class ExpenseActionState extends ExpenseState {}

final class ExpenseInitial extends ExpenseState {}

class ExpenseSuccessState extends ExpenseState {}

class ExpenseFailureState extends ExpenseState {}

class AddExpenseSuccessActionState extends ExpenseActionState {}

class AddExpenseFailureActionState extends ExpenseActionState {}

class EditExpenseSuccessActionState extends ExpenseActionState {}

class EditExpenseFailureActionState extends ExpenseActionState {}

class DeleteExpenseSuccessActionState extends ExpenseActionState {}
