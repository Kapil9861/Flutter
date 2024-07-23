import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

const String reference = "cart_items";

class CartDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductDataModel> _cartRef;
  CartDatabaseService() {
    _cartRef = _firestore.collection(reference).withConverter<ProductDataModel>(
          fromFirestore: (snapshots, _) {
            final data = snapshots.data();
            if (data != null) {
              return ProductDataModel.fromJson(data);
            } else {
              throw Exception("No document found");
            }
          },
          toFirestore: (product, _) => product.toJson(),
        );
  }
  Stream<QuerySnapshot<ProductDataModel>> getProducts() {
    return _cartRef.snapshots();
  }

  Future<void> addProductToWishlist(ProductDataModel product) async {
    await _cartRef.add(product);
  }

  Future<void> removeProductFromWishlist(int productId) async {
    await _cartRef.doc(productId.toString()).delete();
  }

  Future<void> moveProductToWishlist(ProductDataModel product) async {
    CartDatabaseService service = CartDatabaseService();
    service.moveProductToWishlist(product);
  }

  Future<void> movedToCart(ProductDataModel product) async {
    bool exists = await _checkIfProductExists(product.id);
    if (!exists) {
      await _cartRef.add(product);
    } else {
      print("Product Already Exists");
    }
  }

  Future<bool> _checkIfProductExists(int productId) async {
    final querySnapshot =
        await _cartRef.where('id', isEqualTo: productId).get();
    return querySnapshot.docs.isNotEmpty;
  }
}
