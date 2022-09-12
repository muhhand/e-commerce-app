import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,right: 20,left: 20,),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Welcome',fontSize: 30,),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                        child:
                        CustomText(text: 'Sign Up',color: primaryColor,fontSize: 18,)),
                  ],
                ),
                SizedBox(height: 10,),
                CustomText(text: 'Sign in to Continue',fontSize: 14,color: Colors.grey,),
                SizedBox(height: 30,),
                CustomTextFormField(text: 'Email',hint: 'Email Address',
                  validator: (value){
                    if(value == null){
                      print('Error');
                    }
                  },
                  onSave: (value){
                  controller.email = value;
                  },),
                SizedBox(height: 50,),
                CustomTextFormField(text: 'Password',hint: 'Password',
                  validator: (value){
                  if(value == null){
                    print('Error');
                  }
                  },
                  onSave: (value){
                  controller.password = value;
                  },),
                SizedBox(height: 20,),
                CustomText(text: 'Forgot Password?',fontSize: 14,alignment: Alignment.topRight,),
                SizedBox(height: 20,),
                CustomButton(text: 'SIGN IN',
                  onPressed: (){
                  _formkey.currentState.save();
                  if(_formkey.currentState.validate()){
                    controller.signInWithEmailAndPassword();
                  }
                  },),
                SizedBox(height: 20,),
                CustomText(text: '-OR-',alignment: Alignment.center,),
                SizedBox(height: 20,),
                CustomButtonSocial(text: 'Sign In with Facebook',imageName: 'assets/images/facebook.png',
                  onPressed: (){
                  controller.facebookSignInMethod();
                  },),
                SizedBox(height: 20,),
                CustomButtonSocial(text: 'Sign In with Google',imageName: 'assets/images/gmail.png',
                  onPressed: (){
                  controller.googleSignInMethod();
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
