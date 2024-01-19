// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String ? image;
  String ? productName;

  ProductModel({
    this.image,
     this.productName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    image: json["image"],
    productName: json["productName"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "productName": productName,
  };
}
