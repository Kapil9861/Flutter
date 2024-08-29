import 'package:flutter/material.dart';
import 'package:test_app/presentation/riverpod/pages/slivers/pages/customSliverList.dart';
import 'package:test_app/presentation/riverpod/pages/slivers/pages/product.dart';
import 'package:test_app/presentation/riverpod/pages/slivers/pages/sliver_app_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define products list here or fetch from a provider
    List<Product> products = [
      Product(
          id: 1,
          brand: 'Apple',
          title: 'iPhone 9',
          price: 549,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg'),
      Product(
          id: 2,
          brand: 'Apple',
          title: 'iPhone 10',
          price: 459,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg'),
      Product(
          id: 1,
          brand: 'Apple',
          title: 'iPhone 9',
          price: 549,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg'),
      Product(
          id: 2,
          brand: 'Apple',
          title: 'iPhone 10',
          price: 459,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg'),
      Product(
          id: 1,
          brand: 'Apple',
          title: 'iPhone 9',
          price: 549,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg'),
      Product(
          id: 2,
          brand: 'Apple',
          title: 'iPhone 10',
          price: 459,
          images:
              'https://i5.walmartimages.com/seo/Walmart-Family-Mobile-Apple-iPhone-12-5G-64GB-Black-Prepaid-Smartphone-Locked-to-Walmart-Family-Mobile_66b2853b-6cb5-4f20-b73a-b60b39b6de44.6b3bf83a920058a47342318925f1dc2b.jpeg')
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) => ListTile(
            //       title: Text('Item #$index'),
            //     ),
            //     childCount: 10,
            //   ),
            // ),
            const SliverAppHome(),
            CustomMadeSliverGrid(products: products), // Pass products here
          ],
        ),
        // bottomNavigationBar: null,
      ),
    );
  }
}
