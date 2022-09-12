import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/profile_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout/order_history_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value ? Center(child: CircularProgressIndicator()) : Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image:
                              AssetImage(
                              'assets/images/profile.png',
                          )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                Container(
                  child: MaterialButton(onPressed: (){
                    Get.to(OrderHistoryView());
                  },
                    child: Column(
                      children: [
                        ListTile(
                          title: CustomText(text:'Order History',fontSize: 18,),
                          leading: Icon(Icons.history,color: primaryColor,),
                          trailing: Icon(Icons.navigate_next,color: Colors.black,),
                        ),

                      ],
                    ),

                  ),
                ),
                Container(
                  child: MaterialButton(onPressed: (){
                    controller.SignOut();
                    Get.offAll(LoginScreen());
                  },
                    child: Column(
                      children: [
                        ListTile(
                          title: CustomText(text:'Sign Out',fontSize: 18,),
                          leading: Icon(Icons.logout,color: primaryColor,),
                          trailing: Icon(Icons.navigate_next,color: Colors.black,),
                        ),

                      ],
                    ),

                  ),
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}
