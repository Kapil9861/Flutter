import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/wishlist/service/database_service.dart';
import 'package:flutter_bloc_project/features/wishlist/ui/product_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistDataService service = WishlistDataService();
  final WishlistBlocBloc bloc = WishlistBlocBloc();
  @override
  void initState() {
    bloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
        body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
          bloc: bloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          listener: (context, state) {
            if (state is ItemAlreadyInCartActionState) {
              snackbar("Product Updated in Cart", Colors.green);
            } else if (state is MovedToCartActionState) {
              snackbar("Product Moved to Cart", Colors.green);
            } else if (state is RemovedFromCartActionState) {
              snackbar("Product Removed From Wishlist", Colors.green);
            }
          },
          buildWhen: (context, state) => state is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                return StreamBuilder(
                    stream: service.getWishlistItems(),
                    builder: (context, snapshot) {
                      List data = snapshot.data?.docs ?? [];

                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            ProductDataModel product = data[index].data();
                            return WishlistTileWidget(
                              product: product,
                              bloc: bloc,
                            );
                          });
                    });

              // For locally stored data in a file(Data Model)
              // final stateData = state as WishlistSuccessState;
              // return ListView.builder(
              //   itemCount: stateData.product.length,
              //   itemBuilder: (context, index) {
              //     return WishlistTileWidget(
              //         product: stateData.product[index], bloc: bloc);
              //   },
              // );

              case WishlistFailedState:
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
                  child: Text("Something Went Wrong!"),
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

// add the wishlist item tile, check the emitted state and show snackbars acccordingly,
// remember to initialize the initial bloc event and call the consumer of the bloc