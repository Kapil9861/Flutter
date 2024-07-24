part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadSuccessState extends HomeBlocState {
  final List<ProductDataModel> products;
  HomeLoadSuccessState({required this.products});
}

class HomeLoadFailureState extends HomeBlocState {}

class NavigateToCartActionState extends HomeActionState {}

class NaviagetToWishlistActionState extends HomeActionState {}

class AddedToCartActionState extends HomeActionState {}

class AddedToWishlistActionState extends HomeActionState {}

class AddToCartFailedActionState extends HomeActionState {
  AddToCartFailedActionState({required this.message});
  final String message;
}

class AddToWishlistFailedActionState extends HomeActionState {
  AddToWishlistFailedActionState({required this.message});
  final String message;
}
