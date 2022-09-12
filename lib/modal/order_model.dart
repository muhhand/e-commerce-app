import 'dart:convert';

import 'package:ecommerce_app/modal/checkout_model.dart';

import 'cart_product_model.dart';

class OrderModel {
  String  date, street, city, country, phone, totalPrice,name,productname;


  OrderModel(
      {
      this.date,
      this.street,
      this.city,
      this.country,
      this.phone,
      this.totalPrice,
      this.name,

      this.productname
      });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(

      productname: json["productname"],
      date: json["date"],
      street: json["street"],
      city: json["city"],
      country: json["country"],
      phone: json["phone"],
      totalPrice: json["totalPrice"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": this.date,
      "street": this.street,
      "city": this.city,
      "country": this.country,
      "phone": this.phone,
      "totalPrice": this.totalPrice,
      "name": this.name,
      "productname" : this.productname,
    };
  }

//

}
