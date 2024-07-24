part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

sealed class CartActionState extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

class CartFailState extends CartBlocState {}

class CartSuccessState extends CartBlocState {
  CartSuccessState();
}

class RemoveFromCartActionState extends CartActionState {}

class ItemAlreadyInWishlistActionState extends CartActionState {
  final String message;
  ItemAlreadyInWishlistActionState({required this.message});
}

class MovedToWishlistActionState extends CartActionState {}
