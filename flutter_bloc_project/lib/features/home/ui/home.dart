import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cart.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
// The firestore already has the data
import 'package:flutter_bloc_project/features/home/service/database_service.dart';
import 'package:flutter_bloc_project/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_project/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService service = DatabaseService();

  bool isUploaded = false;
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
    // _uploadProductsToFirestore();
  }

  // void _uploadProductsToFirestore() async {
  //   if (!isUploaded) {
  //     await service.uploadToFirestore((error) {
  //       snackbar(error, Colors.red);
  //     });
  //     setState(() {
  //       isUploaded = true;
  //     });
  //   }
  // }

  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (context, state) => state is HomeActionState,
      listener: (context, state) async {
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
        } else if (state is AddedToCartActionState) {
          snackbar("Added to Cart!", Colors.green);
        } else if (state is AddedToWishlistActionState) {
          snackbar("Added to Wishlist!", Colors.green);
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
            // final stateData = state as HomeLoadSuccessState;
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
              body: StreamBuilder(
                  stream: service.getProducts(),
                  builder: (context, snapshot) {
                    List data = snapshot.data?.docs ?? [];
                    if (data.isEmpty) {
                      return const Center(
                        child: Text("No Produccts Found!"),
                      );
                    }
                    return ListView.builder(
                        // This is for local data file
                        // itemCount: stateData.products.length,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          ProductDataModel product = data[index].data();

                          return ProductTileWidget(
                            // this comes from the grocery data file so now updating to the database
                            // product: stateData.products[index],
                            product: product,
                            bloc: homeBloc,
                          );
                        });
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

  void snackbar(
    String message,
    Color color,
  ) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
