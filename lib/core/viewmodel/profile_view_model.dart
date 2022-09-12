import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../modal/user_modal.dart';

class ProfileViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
  final LocalStorageData localStorageData = Get.find();



  UserModel get userModel => _userModel;
  UserModel _userModel;


  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    update();
    _loading.value = false;
  }

   Future<void> SignOut() async {
     GoogleSignIn().signOut();
     FirebaseAuth.instance.signOut();
     localStorageData.deleteUser();
   }


}