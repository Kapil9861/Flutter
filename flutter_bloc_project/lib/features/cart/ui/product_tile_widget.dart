import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

class CartItemsTileWidget extends StatelessWidget {
  const CartItemsTileWidget(
      {super.key, required this.product, required this.bloc});
  final ProductDataModel product;
  final CartBlocBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 40,
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imgUrl,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 19)),
              Text(product.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs. ${product.price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton.filledTonal(
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.red,
                          fill: 0.0,
                        ),
                        onPressed: () {
                          bloc.add(RemoveFromCartEvent(product: product));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: IconButton.filledTonal(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
