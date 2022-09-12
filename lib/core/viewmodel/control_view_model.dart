import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatoreValue = 0;

  get navigatoreValue => _navigatoreValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;


  void changeSelectionValue(int selectedValue) {
    _navigatoreValue = selectedValue;
    switch(selectedValue) {
      case 0 : {
        _currentScreen = HomeView();
        break;
      }
      case 1 : {
        _currentScreen = CartView();
        break;
      }
      case 2 : {
        _currentScreen = ProfileView();
        break;
      }
    }
    update();
  }
}