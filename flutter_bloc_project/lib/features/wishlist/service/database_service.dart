import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';

const String reference = "wishlist_items";

class WishlistDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<ProductDataModel> _wishlistRef;
  WishlistDataService() {
    _wishlistRef =
        _firestore.collection(reference).withConverter<ProductDataModel>(
              fromFirestore: (snapshots, _) {
                final data = snapshots.data();
                if (data != null) {
                  return ProductDataModel.fromJson(data);
                } else {
                  throw Exception("Document not found");
                }
              },
              toFirestore: (product, _) => product.toJson(),
            );
  }

  Stream<QuerySnapshot<ProductDataModel>> getWishlistItems() {
    return _wishlistRef.snapshots();
  }

  Future<void> addProductToWishlist(
      ProductDataModel product, Function(String) message) async {
    bool exists = await _checkIfProductExists(product.id);
    if (!exists) {
      await _wishlistRef.add(product);
    } else {
      message("Product ${product.name} updated in wishlist");
    }
    _wishlistRef.add(product);
  }

  Future<void> removeProductFromWishlist(int productId) async {
    await _wishlistRef.doc(productId.toString()).delete();
  }

  Future<void> movedToWishlist(
      ProductDataModel product, Function(String) onError) async {
    bool exists = await _checkIfProductExists(product.id);
    if (!exists) {
      await _wishlistRef.add(product);
    } else {
      onError("Product ${product.name} updated in wishlist");
    }
  }

  Future<bool> _checkIfProductExists(int productId) async {
    final querySnapshot =
        await _wishlistRef.where('id', isEqualTo: productId).get();
    return querySnapshot.docs.isNotEmpty;
  }
}
