part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadSuccessState extends HomeBlocState {}

class HomeLoadFailureState extends HomeBlocState {}

class NavigateToCartActionState extends HomeActionState {}

class NaviagetToWishlistActionState extends HomeActionState {}
