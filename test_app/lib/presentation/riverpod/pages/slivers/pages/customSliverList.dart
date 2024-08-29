import 'package:flutter/material.dart';
import 'package:test_app/presentation/riverpod/pages/slivers/pages/product.dart';
import 'package:test_app/presentation/riverpod/pages/slivers/pages/product_item.dart';

class CustomMadeSliverGrid extends StatelessWidget {
  final List<Product> products;

  const CustomMadeSliverGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductItem(product: products[index]);
          },
          childCount: products.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.73,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
