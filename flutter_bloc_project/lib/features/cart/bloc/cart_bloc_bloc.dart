import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/features/cart/service/database_service.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/service/database_service.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartDatabaseService service = CartDatabaseService();
  late String message = "";
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartBlocEvent>((event, emit) {});
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
    on<MoveToWishlistEvent>(moveToWishlistEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccessState());
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    service.removeProductFromWishlist(event.product.id);
    emit(RemoveFromCartActionState());
    emit(CartSuccessState());
  }

  FutureOr<void> moveToWishlistEvent(
      MoveToWishlistEvent event, Emitter<CartBlocState> emit) {
    WishlistDataService wishlistService = WishlistDataService();

    wishlistService.movedToWishlist(event.product, (error) {
      message = error;
    });
    if (message.isNotEmpty) {
      emit(ItemAlreadyInWishlistActionState(message: message));
    }
    if (!emit.isDone) {
      emit(MovedToWishlistActionState());
    }
    service.removeProductFromWishlist(event.product.id);
    emit(CartSuccessState());
  }
}
