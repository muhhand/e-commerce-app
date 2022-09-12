import 'package:flutter/material.dart';

import '../helper/extenstion.dart';

class CartProductModel {
  String name,image,price,productid;
  int quantity;

  CartProductModel(
      {this.name,
        this.image,
        this.quantity,
        this.price,
        this.productid

      });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if(map == null){
      return;
    }
    name = map['name'];
    image =map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productid = map['productid'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "quantity": quantity,
      "price": price,
      'productid': productid,
    };
  }
}