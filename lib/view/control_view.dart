import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/viewmodel/control_view_model.dart';
import 'cart_view.dart';
import 'home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
   ControlView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
        init: Get.put(ControlViewModel()),
          builder:(controller) => Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: buttomNavigationBar(),
          ),
      );
    });

  }
  Widget buttomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text('Explore',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/Icon_Explore.png',fit: BoxFit.contain,width: 20,),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/Icon_Cart.png',fit: BoxFit.contain,width: 20,),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text('Account',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/Icon_User.png',fit: BoxFit.contain,width: 20,),
            ),
          ),
        ],
        currentIndex: controller.navigatoreValue,
        onTap: (index) {
          controller.changeSelectionValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
