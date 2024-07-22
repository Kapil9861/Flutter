import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/cart_items.dart';
import 'package:flutter_bloc_project/data/grocery_data.dart';
import 'package:flutter_bloc_project/data/wish_list.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:flutter_bloc_project/features/home/service/database_service.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final groceryData = GroceryData();
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocEvent>((event, emit) {});
    on<HomeInitialEvent>(homeInitialEvent);
    on<NavigateToWishlistEvent>(navigateToWishlistEvent);
    on<NavigateToCartEvent>(navigateToCartEvent);
    on<AddToWishlistButtonClickedEvent>(addToWishlictButtonClickedEvent);
    on<AddToCartButtonClickedEvent>(addToCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    DatabaseService service = DatabaseService();
    service.uploadToFirestore();
    emit(
      HomeLoadSuccessState(
          products: groceryData.groceryProducts
              .map(
                (product) => ProductDataModel(
                  description: product['description'],
                  id: product['id'] as int,
                  name: product['name'],
                  imgUrl: product['imageUrl'],
                  price: product['price'],
                ),
              )
              .toList()),
    );
  }

  FutureOr<void> navigateToWishlistEvent(
      NavigateToWishlistEvent event, Emitter<HomeBlocState> emit) {
    emit(NaviagetToWishlistActionState());
  }

  FutureOr<void> navigateToCartEvent(
      NavigateToCartEvent event, Emitter<HomeBlocState> emit) {
    emit(NavigateToCartActionState());
  }

  FutureOr<void> addToWishlictButtonClickedEvent(
      AddToWishlistButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    wishlist.add(event.product);
    emit(AddedToWishlistActionState());
  }

  FutureOr<void> addToCartButtonClickedEvent(
      AddToCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    cartItems.add(event.product);
    emit(AddedToCartActionState());
  }
}
