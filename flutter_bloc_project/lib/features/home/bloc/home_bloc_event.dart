part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class AddToCartButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel product;
  AddToCartButtonClickedEvent({required this.product});
}

class AddToWishlistButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel product;
  AddToWishlistButtonClickedEvent({required this.product});
}

class NavigateToCartEvent extends HomeBlocEvent {}

class NavigateToWishlistEvent extends HomeBlocEvent {}
