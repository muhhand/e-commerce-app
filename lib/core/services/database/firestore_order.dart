import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';import '../../../modal/cart_product_model.dart';


import '../../../modal/checkout_model.dart';
import '../../../modal/order_model.dart';


class FirestoreOrder {
  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      .collection('Orders');

  addOrdersToFirestore(OrderModel orderModel) async {
    await _ordersCollection.doc().set(orderModel.toJson());
  }
}