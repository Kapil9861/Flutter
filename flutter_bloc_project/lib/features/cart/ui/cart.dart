import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/cart/service/database_service.dart';
import 'package:flutter_bloc_project/features/cart/ui/product_tile_widget.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartDatabaseService service = CartDatabaseService();
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: BlocConsumer<CartBlocBloc, CartBlocState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          listener: (context, state) {
            print(state);
            if (state is RemoveFromCartActionState) {
              snackbar("Removed From Cart", Colors.red);
            } else if (state is MovedToWishlistActionState) {
              snackbar("Product Moved to Cart", Colors.green);
            } else if (state is ItemAlreadyInWishlistActionState) {
              snackbar("Product Updated in Wishlist!", Colors.green);
            }
          },
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                return StreamBuilder(
                    stream: service.getProducts(),
                    builder: (context, snapshot) {
                      List data = snapshot.data?.docs ?? [];
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            ProductDataModel product = data[index].data();
                            return CartItemsTileWidget(
                              product: product,
                              bloc: cartBloc,
                            );
                          });
                    });
              // For locally stored data in a file (Data Model)
              // final cartData = state as CartSuccessState;
              // return ListView.builder(
              //     itemCount: cartData.cartItems.length,
              //     itemBuilder: (context, index) {
              //       return CartItemsTileWidget(
              //           product: cartData.cartItems[index], bloc: cartBloc);
              //     });
              case CartFailState:
                return const Scaffold(
                  body: Center(
                    child: Text(
                      "Error loading!",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              default:
                return const SizedBox(
                  child: Text("Default Case"),
                );
            }
          },
        ),
      ),
    );
  }

  void snackbar(String message, Color color) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
