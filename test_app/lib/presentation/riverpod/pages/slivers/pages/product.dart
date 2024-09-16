// Define the Product class
class Product {
  final int id;
  final String brand;
  final String title;
  final double price;
  final String images;

  // Constructor
  Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    required this.images,
  });

  // Factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brand: json['brand'],
      title: json['title'],
      price: (json['price'] as num).toDouble(), // Convert price to double
      images: json['images'],
    );
  }

  // Method to convert a Product instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'title': title,
      'price': price,
      'images': images,
    };
  }

  // Optional: Override toString() for easy debugging
  @override
  String toString() {
    return 'Product(id: $id, brand: $brand, title: $title, price: $price, images: $images)';
  }
}
