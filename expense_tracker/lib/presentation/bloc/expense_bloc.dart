import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<ExpenseEvent>((event, emit) {});
    on<InitialExpenseEvent>(initialExpenseEvent);
    on<AddExpenseEvent>(addExpenseEvent);
    on<DeleteExpenseEvent>(deleteExpenseEvent);
    on<EditExpenseEvent>(editExpenseEvent);
  }

  FutureOr<void> editExpenseEvent(
      EditExpenseEvent event, Emitter<ExpenseState> emit) {}

  FutureOr<void> addExpenseEvent(
      AddExpenseEvent event, Emitter<ExpenseState> emit) {}

  FutureOr<void> initialExpenseEvent(
      InitialExpenseEvent event, Emitter<ExpenseState> emit) {}

  FutureOr<void> deleteExpenseEvent(
      DeleteExpenseEvent event, Emitter<ExpenseState> emit) {}
}
