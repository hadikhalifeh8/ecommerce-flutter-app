import 'package:ecommerce/controller/pages/homeScreenconroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customButtonAppBarHome7.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenconrollerImp());
    return GetBuilder<HomeScreenconrollerImp>(builder: (controller) =>  Scaffold( 

    floatingActionButton: FloatingActionButton(onPressed: (){},
                          backgroundColor:AppColor.primaryColor,   
                          child: const Icon(Icons.shopping_basket_outlined), 
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      // BottomNavigationBar
      bottomNavigationBar:const CustomButtonAppBarHome(),
   

      body: 
      controller.listPage.elementAt(controller.currentpage),
    ));
  }
}