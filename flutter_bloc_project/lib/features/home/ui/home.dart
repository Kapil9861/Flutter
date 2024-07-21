import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cart.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_project/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (context, state) => state is HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCartActionState) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const Cart();
            }),
          );
        } else if (state is NaviagetToWishlistActionState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Wishlist(),
            ),
          );
        }
      },
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadSuccessState:
            final stateData = state as HomeLoadSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Grocery App",
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    onPressed: () {
                      homeBloc.add(NavigateToCartEvent());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        homeBloc.add(NavigateToWishlistEvent());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: stateData.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        product: stateData.products[index]);
                  }),
            );
          case HomeLoadFailureState:
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
    );
  }
}
