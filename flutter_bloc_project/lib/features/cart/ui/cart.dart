import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
            if (state is RemoveFromCartAction) {
              snackbar("Removed From Cart", Colors.red);
            }
          },
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final cartData = state as CartSuccessState;
                return ListView.builder(
                    itemCount: cartData.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemsTileWidget(
                          product: cartData.cartItems[index], bloc: cartBloc);
                    });
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
