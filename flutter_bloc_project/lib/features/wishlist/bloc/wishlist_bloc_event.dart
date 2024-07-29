part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent {}

class WishlistMoveToCartEvent extends WishlistBlocEvent {
  final ProductDataModel product;
  WishlistMoveToCartEvent({required this.product});
}

class RemoveFromWishlistEvent extends WishlistBlocEvent {
  final ProductDataModel product;
  RemoveFromWishlistEvent({required this.product});
}
