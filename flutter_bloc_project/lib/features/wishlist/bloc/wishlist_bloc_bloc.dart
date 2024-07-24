import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/features/cart/service/database_service.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/service/database_service.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistDataService service = WishlistDataService();
  late String message = "";
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {});
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
    on<WishlistMoveToCartEvent>(wishlistMoveToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState());
  }

  FutureOr<void> removeFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistBlocState> emit) async {
    await service.removeProductFromWishlist(event.product.id);
    emit(RemovedFromCartActionState());
    emit(WishlistSuccessState());
  }

  FutureOr<void> wishlistMoveToCartEvent(
      WishlistMoveToCartEvent event, Emitter<WishlistBlocState> emit) {
    CartDatabaseService cartService = CartDatabaseService();
    cartService.movedToCart(event.product, (error) {
      message = error;
    });
    if (message.isNotEmpty) {
      emit(ItemAlreadyInCartActionState(message: message));
    }
    emit(MovedToCartActionState());
    service.removeProductFromWishlist(event.product.id);
    emit(WishlistSuccessState());
  }
}
