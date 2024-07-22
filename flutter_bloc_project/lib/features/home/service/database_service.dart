import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_project/data/grocery_data.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

const String reference = "grocery_products";

class DatabaseService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  late final CollectionReference<ProductDataModel> _productsRef;

  DatabaseService() {
    _productsRef =
        _fireStore.collection(reference).withConverter<ProductDataModel>(
              fromFirestore: (snapshots, _) {
                final data = snapshots.data();
                if (data != null) {
                  return ProductDataModel.fromJson(data);
                } else {
                  throw Exception('Document does not exist');
                }
              },
              toFirestore: (product, _) => product.toJson(),
            );
  }

  Stream<QuerySnapshot<ProductDataModel>> getProducts() {
    return _productsRef.snapshots();
  }

  Future<void> addProduct(ProductDataModel product) async {
    await _productsRef.add(product);
  }

  Future<void> updateProduct(int productId, ProductDataModel product) async {
    await _productsRef.doc(productId.toString()).update(product.toJson());
  }

  Future<void> deleteProduct(int productId) async {
    await _productsRef.doc(productId.toString()).delete();
  }

  Future<void> uploadToFirestore() async {
    GroceryData data = GroceryData();
    for (var individualProduct in data.groceryProducts) {
      ProductDataModel product = ProductDataModel.fromJson(individualProduct);
      try {
        bool exists = await _checkIfProductExists(product.id);
        if (!exists) {
          await _productsRef.add(product);
          print("Product added: ${product.name}");
        } else {
          print("Product already exists: ${product.name}");
        }
      } catch (error) {
        print("Error adding product: $error");
      }
    }
  }

  Future<bool> _checkIfProductExists(int productId) async {
    final querySnapshot =
        await _productsRef.where('id', isEqualTo: productId).get();
    return querySnapshot.docs.isNotEmpty;
  }
}
