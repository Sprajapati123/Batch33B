import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_3/model/product_model.dart';

class ProductRepository {
  final instance =
      FirebaseFirestore.instance.collection('products').withConverter(
            fromFirestore: (snapshot, options) =>
                ProductModel.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (ProductModel value, options) => value.toJson(),
          );

  Future<dynamic> saveData(ProductModel model) async {
    final res = await instance.add(model);
    return res;
  }
}
