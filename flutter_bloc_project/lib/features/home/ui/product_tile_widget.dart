import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget(
      {super.key, required this.product, required this.bloc});
  final ProductDataModel product;
  final HomeBlocBloc bloc;

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
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          bloc.add(AddToWishlistButtonClickedEvent(
                              product: product));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined),
                          onPressed: () {
                            bloc.add(
                                AddToCartButtonClickedEvent(product: product));
                          },
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
