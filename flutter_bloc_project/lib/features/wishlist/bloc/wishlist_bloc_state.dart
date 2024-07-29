part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocState {}

final class WishlistBlocInitial extends WishlistBlocState {}

sealed class WishlistActionState extends WishlistBlocState {}

class WishlistSuccessState extends WishlistBlocState {}

class WishlistFailedState extends WishlistBlocState {}

class MovedToCartActionState extends WishlistActionState {}

class RemovedFromCartActionState extends WishlistActionState {}

class ItemAlreadyInCartActionState extends WishlistActionState {
  ItemAlreadyInCartActionState({required this.message});
  final String message;
}
