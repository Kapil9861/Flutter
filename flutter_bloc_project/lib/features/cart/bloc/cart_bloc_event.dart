part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class CartInitialEvent extends CartBlocEvent {}

class RemoveFromCartEvent extends CartBlocEvent {
  final ProductDataModel product;

  RemoveFromCartEvent({required this.product});
}
