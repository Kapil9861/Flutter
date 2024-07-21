part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class AddToCartButtonClickedEvent extends HomeBlocState {}

class AddToWishlictButtonClickedEvent extends HomeBlocState {}

class NavigateToCartEvent extends HomeBlocState {}

class NavigateToWishlistEvent extends HomeBlocState {}
