import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/helper/local_storage_data.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:get/get.dart';

import '../core/viewmodel/cart_view_model.dart';
import '../core/viewmodel/checkout_view_model.dart';
import '../core/viewmodel/control_view_model.dart';
import '../core/viewmodel/profile_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => AuthViewModel());
   Get.lazyPut(() => ControlViewModel());
   Get.lazyPut(() => HomeViewModel());
   Get.lazyPut(() => CartViewModel());
   Get.lazyPut(() => LocalStorageData());
   Get.lazyPut(() => CheckOutViewModel());
  }

}