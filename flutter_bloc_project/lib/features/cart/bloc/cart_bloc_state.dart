part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

sealed class CartActionState extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

class CartFailState extends CartBlocState {}

class CartSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}

class RemoveFromCartAction extends CartActionState {}
