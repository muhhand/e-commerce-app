import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/viewmodel/control_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/details_screen.dart';
import 'package:ecommerce_app/view/search_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_products_view.dart';

class HomeView extends StatelessWidget {
   HomeView({Key key}) : super(key: key);

   final List<String> names = ['s','s','s','s','s',];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator(color: Colors.black,))
          : Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60,left: 20,right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                SizedBox(height: 20,),
                Image.asset('assets/images/banner4.png',fit: BoxFit.cover,),
                SizedBox(height: 20,),
                CustomText(text: 'Categories',fontSize: 21,fontWeight: FontWeight.bold,),
                SizedBox(height: 20,),
                _listViewCategory(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Best Selling',fontSize: 18,fontWeight: FontWeight.bold,),
                  ],
                ),
                //SizedBox(height: 30,),
                _listViewProduct(),
              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        onFieldSubmitted: (value) {
          Get.to(SearchView(value));
        },
        decoration: InputDecoration(
          hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder:(controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: () {
                Get.to(CategoryProductsView(
                  categoryName: controller.categoryModel[index].name,
                  products: controller.productModel
                      .where((product) =>
                  product.category ==
                      controller.categoryModel[index].name)
                      .toList(),
                ));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey.shade100,
                    ),
                    height: 60,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(controller.categoryModel[index].image,fit: BoxFit.fitHeight,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomText(text: controller.categoryModel[index].name,),

                ],
              ),
            );
          }, separatorBuilder: ( context,index) => SizedBox(width: 15,),),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder:(controller) => Container(
        height: 350,
        child: GridView.builder(
          padding: const EdgeInsets.all(0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 15,
            mainAxisExtent: 280,
          ),
          itemCount: 4,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.to(DetailsScreen(
                  controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.grey.shade50,
                      ),
                      child:
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height : 160,
                          child: Image.network(controller.productModel[index].image,fit: BoxFit.fitWidth,)),
                    ),
                    SizedBox(height: 10,),
                    CustomText(text: controller.productModel[index].name,alignment: Alignment.bottomLeft,fontSize: 16,),
                    SizedBox(height: 10,),
                    CustomText(text: controller.productModel[index].brand,alignment: Alignment.bottomLeft,color: Colors.grey,fontSize: 12,maxlines: 1,),
                    CustomText(text: '\$'+controller.productModel[index].price.toString(),alignment: Alignment.bottomLeft,color: primaryColor,fontSize: 16,),
                  ],
                ),
              ),
            );
          },
        )
      )
    );
  }


}
