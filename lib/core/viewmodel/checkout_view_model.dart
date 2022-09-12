import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../helper/enum.dart';
import '../../modal/cart_product_model.dart';
import '../../modal/checkout_model.dart';
import '../../modal/order_model.dart';
import '../services/database/firestore_order.dart';
import '../services/firestore_checkout.dart';
import 'cart_view_model.dart';
import 'package:intl/intl.dart';

class CheckOutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;

  String street, city, state, country, phone,name;


  List<CheckoutModel> _checkouts = [];

  List<CheckoutModel> get checkouts => _checkouts;

  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;


  GlobalKey<FormState> formState = GlobalKey();

  void changeIndex(int i){
    if(i == 0 || i < 0){
      _pages = Pages.DeliveryTime;
      _index = i;
    }
    else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    }
    else if (i == 2) {
      formState.currentState.save();
      if(formState.currentState.validate()){
        _pages = Pages.Summary;
        _index = i;
      }
    }
    else if (i == 3) {
      Get.to(ControlView());
      _pages = Pages.DeliveryTime;
      _index = 0;

    }
    update();
  }


  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }


  @override
  void onInit() {
    super.onInit();
    _getCheckoutsFromFireStore();
  }

  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    _checkouts = [];
    List<QueryDocumentSnapshot> _checkoutsSnapshot =
    await FirestoreCheckout().getOrdersFromFirestore();
    _checkoutsSnapshot.forEach((order) {
      _checkouts
          .add(CheckoutModel.fromJson(order.data() as Map<String, dynamic>));
    });
    _isLoading = false;
    update();
  }

  addCheckoutToFireStore() async {
    await FirestoreCheckout().addOrderToFirestore(CheckoutModel(
      street: street,
      city: city,
      country: country,
      phone: phone,
      totalPrice: Get.find<CartViewModel>().totalprice.toString(),
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
    ));
    Get.find<CartViewModel>().removeAllProducts();
    Get.to(ControlView());
    _getCheckoutsFromFireStore();
  }

  addOrderToFireStore() async {
    List yourItemList = [];
    for (int i = 0; i < Get.find<CartViewModel>().cartProductModel.length; i++ )
      yourItemList.add({
        "name": Get.find<CartViewModel>().cartProductModel[i].name,
      });
     {
      await FirestoreOrder().addOrdersToFirestore(OrderModel(
        name: name,
        street: street,
        city: city,
        country: country,
        phone: phone,
        totalPrice: Get
            .find<CartViewModel>()
            .totalprice
            .toString(),
        date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
        productname: yourItemList.toString().replaceAll('[', '').replaceAll(']', '').replaceAll('{', '').replaceAll('}', ''),
      ));
    }
  }
}
