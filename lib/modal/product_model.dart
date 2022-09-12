import 'package:flutter/material.dart';

import '../helper/extenstion.dart';

class ProductModel {
  String name,image,description,size,price,brand,productid,category;
  Color color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,
      this.brand,
        this.productid,
        this.category,
      });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if(map == null){
      return;
    }
    name = map['name'];
    image =map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
    brand = map['brand'];
    productid = map['productid'];
    category = map['category'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "color": color,
      "size": size,
      "price": price,
      "brand": brand,
      'productid': productid,
      'category' : category,
    };
  }
}