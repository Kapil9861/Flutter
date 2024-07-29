class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imgUrl;
  ProductDataModel({
    required this.description,
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as int,
          name: json['name'],
          description: json['description'],
          price: json['price'] is int
              ? (json['price'] as int).toDouble()
              : json['price'],
          imgUrl: json['imageUrl'],
        );

  Map<String, Object> toJson() {
    return {
      'id': id,
      "name": name,
      "description": description,
      "price": price,
      "imageUrl": imgUrl,
    };
  }

  ProductDataModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? imgUrl,
  }) {
    return ProductDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
