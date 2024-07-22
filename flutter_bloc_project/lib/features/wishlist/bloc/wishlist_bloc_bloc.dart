import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/cart_items.dart';
import 'package:flutter_bloc_project/data/wish_list.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {});
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
    on<WishlistMoveToCartEvent>(wishlistMoveToCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(product: wishlist));
  }

  FutureOr<void> removeFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistBlocState> emit) {
    wishlist.remove(event.product);
    emit(RemovedFromCartActionState());
    emit(WishlistSuccessState(product: wishlist));
  }

  FutureOr<void> wishlistMoveToCartEvent(
      WishlistMoveToCartEvent event, Emitter<WishlistBlocState> emit) {
    if (cartItems.contains(event.product)) {
      emit(ItemAlreadyInCartActionState());
    } else {
      cartItems.add(event.product);
      emit(MovedToCartActionState());
    }
    wishlist.remove(event.product);
    emit(WishlistSuccessState(product: wishlist));
  }
}
