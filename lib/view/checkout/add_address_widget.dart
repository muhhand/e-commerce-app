import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/checkout_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder:(controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.check,color: primaryColor,size: 30,),
                      CustomText(text: 'Billing address is the same as delivery address', fontSize: 14,alignment: Alignment.center,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.name = value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please enter your name';
                      }
                    },
                    text: 'Name',
                    hint: 'Name',
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.street = value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please enter your street';
                      }
                    },
                    text: 'Street',
                    hint: 'Street',
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    type: TextInputType.number,
                    onSave: (value){
                      controller.phone = value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please enter your phone';
                      }
                    },
                    text: 'Phone Number',
                    hint: 'Phone Number',
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.country = value;
                              },
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Please enter your country';
                                }
                              },
                              text: 'Country',
                              hint: 'Country',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.city = value;
                              },
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Please enter your city';
                                }
                              },
                              text: 'City',
                              hint: 'City',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
