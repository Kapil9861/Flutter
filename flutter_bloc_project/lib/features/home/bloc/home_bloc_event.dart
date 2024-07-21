part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}
class HomeInitialEvent extends HomeBlocEvent{}

class AddToCartButtonClickedEvent extends HomeBlocEvent {}

class AddToWishlictButtonClickedEvent extends HomeBlocEvent {}

class NavigateToCartEvent extends HomeBlocEvent {}

class NavigateToWishlistEvent extends HomeBlocEvent {}
