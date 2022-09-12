import 'package:ecommerce_app/modal/cart_product_model.dart';
import 'package:ecommerce_app/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/database/cart_database_helper.dart';

class CartViewModel  extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalprice => _totalprice;
  double _totalprice = 0.0;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel(){
    getAllProducts();

  }

  getAllProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice(){
    for(int i = 0; i <_cartProductModel.length; i++){
      _totalprice += (double.parse(_cartProductModel[i].price)*
          _cartProductModel[i].quantity
      );
      update();
    }
  }

  addProduct (CartProductModel cartProductModel) async {

      for(int i = 0; i<_cartProductModel.length; i++ ) {
        if (_cartProductModel[i].productid == cartProductModel.productid) {
          return;
        }
      }
        var dbHelper = CartDatabaseHelper.db;
        await dbHelper.insert(cartProductModel);
        _cartProductModel.add(cartProductModel);
      _totalprice += (double.parse(cartProductModel.price)*
          cartProductModel.quantity
      );

      update();
    }


    increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalprice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
    }

  decreaseQuantity(int index) async {
    if (_cartProductModel[index].quantity != 1) {
      _cartProductModel[index].quantity--;
      _totalprice -= (double.parse(_cartProductModel[index].price));
      await dbHelper.updateProduct(_cartProductModel[index]);
      update();
    }
  }

  removeProduct(String productId) async {
    await CartDatabaseHelper.db.deleteProduct(productId);
    getAllProducts();
  }

  removeAllProducts() async {
    await CartDatabaseHelper.db.deleteAllProducts();
    getAllProducts();
  }

}