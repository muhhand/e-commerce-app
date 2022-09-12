import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';import '../../constants.dart';
import '../widgets/custom_button.dart';


import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
   RegisterView({Key key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        GestureDetector(
          onTap: (){
            Get.off(LoginScreen());
          },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,right: 20,left: 20,),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                CustomText(text: 'Sign Up',fontSize: 30,),
                SizedBox(height: 10,),

                SizedBox(height: 30,),
                CustomTextFormField(text: 'Name',hint: 'Username',
                  validator: (value){
                    if(value == null){
                      print('Error');
                    }
                  },
                  onSave: (value){
                    controller.name = value;
                  },),
                SizedBox(height: 50,),
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
                SizedBox(height: 50,),
                CustomButton(text: 'SIGN UP',
                  onPressed: (){
                    _formkey.currentState.save();
                    if(_formkey.currentState.validate()){
                      controller.signUpWithEmailAndPassword();
                    }
                  },),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}