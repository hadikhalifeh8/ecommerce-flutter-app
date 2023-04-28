import 'dart:io';

import 'package:ecommerce/controller/pages/home/homeScreenconroller.dart';
import 'package:ecommerce/controller/pages/home/productDetailscontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customButtonAppBarHome7.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenconrollerImp());
   // ProductDetalsControllerImp productController = Get.put(ProductDetalsControllerImp());

    return GetBuilder<HomeScreenconrollerImp>(builder: (controller) =>  Scaffold( 

    floatingActionButton: FloatingActionButton(onPressed: ()
    {
      // productController.goToCartPage();
    Get.toNamed(AppRoute.mycart);
    },
                          backgroundColor:AppColor.primaryColor,   
                          child: const Icon(Icons.shopping_basket_outlined), 
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      // BottomNavigationBar
      bottomNavigationBar:const CustomButtonAppBarHome(),
   

      body: // add Dialog Exit for App
    //  controller.listPage.elementAt(controller.currentpage),
    WillPopScope(child: controller.listPage.elementAt(controller.currentpage), 
    onWillPop: (){

      Get.defaultDialog(
                         title: "Warning",
                         titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor),

                         middleText: "Are You Sure Exit App",
                         middleTextStyle: const TextStyle(fontSize: 16.0),


                         onConfirm: (){exit(0);},
                         confirmTextColor: AppColor.thirdColor,

                         onCancel: (){},
                         cancelTextColor: AppColor.thirdColor,

                          buttonColor: AppColor.secoundColor,

      
      );
      return Future.value(false);
    })
    ));
  }
}