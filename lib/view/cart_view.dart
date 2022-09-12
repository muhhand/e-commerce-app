import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/view/checkout/checkout_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
   CartView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find(),
    builder:(controller) => Scaffold(
      body:  controller.cartProductModel.length == 0  ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/cart.svg',height: 200,width: 200,),
          SizedBox(height: 15,),
          CustomText(text: 'Cart is empty',fontSize: 22,alignment: Alignment.center,color: primaryColor,)
        ],
      ) :  Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: ListView.separated(
                    itemCount: controller.cartProductModel.length,
                      itemBuilder: (context,index){
                      return Container(
                        height: 160,
                        child: Row(
                          children: [
                            Container(
                                width: 140,
                                child: Image.network(controller.cartProductModel[index].image,fit: BoxFit.contain,)),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                padding: EdgeInsets.only(top: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.5,
                                        child: CustomText(text: controller.cartProductModel[index].name,fontSize: 16,)),
                                    SizedBox(height: 6,),
                                    CustomText(text: '${controller.cartProductModel[index].price.toString()} LE ',color: primaryColor,fontSize: 16),
                                    SizedBox(height: 10,),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 40,
                                            color: Colors.grey.shade200,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    child:
                                                    Icon(Icons.add,color: Colors.black,),
                                                  onTap: (){
                                                      controller.increaseQuantity(index);
                                                  },),
                                                SizedBox(width: 20,),
                                                CustomText(text: controller.cartProductModel[index].quantity.toString(),alignment: Alignment.center,),
                                                SizedBox(width: 20,),
                                                GestureDetector(
                                                  onTap: (){
                                                    controller.decreaseQuantity(index);
                                                  },
                                                  child: Container(
                                                      padding: EdgeInsets.only(bottom: 20),
                                                      child: Icon(Icons.minimize,color: Colors.black,)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40,),
                                          GetBuilder<CartViewModel>(builder: (controller) => IconButton(onPressed: (){
                                            controller.removeProduct(controller.cartProductModel[index].productid);
                                          }, icon: Icon(Icons.delete,color: primaryColor,)))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                      }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 15,); },),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: 'TOTAL',fontSize: 12,color: Colors.grey,),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                          builder:(controller) => CustomText(text: '${controller.totalprice}',color: primaryColor,fontSize: 22,))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 180,
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                          onPressed: (){
                            Get.to(CheckOutView());
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(12),
                          color: primaryColor,
                          textColor: Colors.white,
                          child: Text('CHECKOUT'),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
    );

  }
}
