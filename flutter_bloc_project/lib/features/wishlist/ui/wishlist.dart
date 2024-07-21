import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
      ),
    );
  }
}

// add the wishlist item tile, check the emitted state and show snackbars acccordingly,
// remember to initialize the initial bloc event and call the consumer of the bloc