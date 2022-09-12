import 'package:ecommerce_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/viewmodel/cart_view_model.dart';
import 'helper/binding.dart';
import 'onboarding.dart';
import 'view/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: OnBoardingScreen(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSan'
      ),
    );
  }
}

