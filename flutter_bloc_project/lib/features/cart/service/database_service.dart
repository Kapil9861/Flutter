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
}
