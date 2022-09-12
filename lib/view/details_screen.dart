import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/modal/product_model.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../modal/cart_product_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(this._model);

 final ProductModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                  child: Image.network(_model.image,fit: BoxFit.cover,)
              ),
                Positioned(
                  top: 160,
                  left: 10,
                  child: GestureDetector(
                      onTap: (){
                        Get.off(ControlView());
                      },
                      child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                ),
              ]
            ),
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(text: _model.name,fontSize: 26,fontWeight: FontWeight.bold,),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Size',),
                              CustomText(text: _model.size,),
                            ],
                          )),
                          Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width*0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: 'Color',),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(12),
                                      color: _model.color
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 15,),
                      CustomText(text: 'Details',fontWeight: FontWeight.bold,fontSize: 18,),
                      SizedBox(height: 15,),
                      CustomText(text: _model.description,fontSize: 14,hight: 2,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: 'Price',fontSize: 12,color: Colors.grey,),
                      CustomText(text: _model.price+' LE',fontSize: 18,color: primaryColor,fontWeight: FontWeight.bold,),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder:(controller) => Container(
                      child: MaterialButton(
                        onPressed: () {
                          controller.addProduct(
                              CartProductModel(
                                name: _model.name,
                                price: _model.price,
                                image: _model.image,
                                quantity: 1,
                                productid: _model.productid
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: 1.seconds,
                            content: Text("Added to cart"),
                          ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(12),
                        color: primaryColor,
                        textColor: Colors.white,
                        child: Text('ADD'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
