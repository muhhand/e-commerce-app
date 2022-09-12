import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/modal/user_modal.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn  = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email,password,name;

  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

   final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

  UserCredential userCredential = await _auth.signInWithCredential(credential).then((user) {
    saveUser(user);
    Get.offAll(ControlView());
  });
  }



  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken.token;
    if(result.status == FacebookLoginStatus.success){
     final faceCredential = FacebookAuthProvider.credential(accessToken);
     await _auth.signInWithCredential(faceCredential).then((user) async {
       saveUser(user);
       Get.offAll(ControlView());
     });
    }
  }

  void signInWithEmailAndPassword() async {
    try{
      await _auth.signInWithEmailAndPassword(email: email ,password: password)
          .then((value)async {
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(ControlView());
    }catch (e){
      print(e.message);
      Get.snackbar('Error Log In', e.message,colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try{
      await _auth
          .createUserWithEmailAndPassword(email: email ,password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(ControlView());
    }catch (e){
      print(e.message);
      Get.snackbar('Error Log In', e.message,colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }


  void saveUser(UserCredential user) async {

    UserModel userModel = UserModel(
      userId: user.user.uid,
      name: name == null ? user.user.displayName : name,
      email: user.user.email,
      pic: '',
    );
    await FireStoreUsers().addUserToFireStore(userModel);
    setUser(userModel);

  }


  void getCurrentUserData (String uid) async {
    await FireStoreUsers().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

}