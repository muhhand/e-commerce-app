import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/checkout_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder:(controller) => Column(
          children: [
            Container(
              height: 250,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150,
                                height: 180,
                                child: Image.network(controller.cartProductModel[index].image,fit: BoxFit.fitWidth,)),
                            Container(
                              width: 150,
                                child: CustomText(text: controller.cartProductModel[index].name,overflow: TextOverflow.ellipsis,maxlines: 2,)),
                            SizedBox(height: 10,),
                            CustomText(text: '${controller.cartProductModel[index].price} LE  x ${controller.cartProductModel[index].quantity} ',color: primaryColor,alignment: Alignment.bottomLeft,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: controller.cartProductModel.length, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomText(text: 'Total Bill ${controller.totalprice.toString()} LE', fontSize: 18,fontWeight: FontWeight.bold,color: primaryColor, alignment: Alignment.center,),
                  SizedBox(height: 10,),
                  CustomText(text: 'Shipping Address', fontSize: 18,fontWeight: FontWeight.bold,),
                ],
              ),
            ),
            GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) =>Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  text: '${controller.name + ' ,' + controller.street + ' ,' + controller.phone + ' ,' + controller.city + ' ,' + controller.country}',color: Colors.grey,fontSize: 24,),
            ))
          ],
        ),
      ),
    );
  }
}
