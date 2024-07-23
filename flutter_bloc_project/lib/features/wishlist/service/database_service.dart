import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_project/features/home/models/product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/service/database_service.dart';

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

  Future<void> addProductToWishlist(ProductDataModel product) async {
    await _wishlistRef.add(product);
  }

  Future<void> removeProductFromWishlist(int productId) async {
    await _wishlistRef.doc(productId.toString()).delete();
  }

  Future<void> moveProductToCart(ProductDataModel product) async {
    WishlistDataService service = WishlistDataService();
    service.moveProductToCart(product);
  }

  Future<void> movedToWishlist(ProductDataModel product) async {
    bool exists = await _checkIfProductExists(product.id);
    if (!exists) {
      await _wishlistRef.add(product);
    } else {
      print("Product Already Exists");
    }
  }

  Future<bool> _checkIfProductExists(int productId) async {
    final querySnapshot =
        await _wishlistRef.where('id', isEqualTo: productId).get();
    return querySnapshot.docs.isNotEmpty;
  }
}
