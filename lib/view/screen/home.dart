 import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/homecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customTitleitemhome4.dart';
import 'package:ecommerce/view/widget/home/customappbar1.dart';
import 'package:ecommerce/view/widget/home/customcardhome2.dart';
import 'package:ecommerce/view/widget/home/listCategorieshome3.dart';
import 'package:ecommerce/view/widget/home/listItemshome5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
 
 
 //HomeScreen هيدي الصفحه هيي جزء من صفحه ال 
 // هيي الصفحه الرئيسيه HomeScreen 

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   //  HomeControllerImp controller = Get.put(HomeControllerImp());
      Get.put(HomeControllerImp());
 
   
    return  GetBuilder<HomeControllerImp>(builder: (controller)=> 
     
     HandlingDataView(statusRequest: controller.statusRequest, 
          widget:  Container(
      padding:const EdgeInsets.symmetric(horizontal: 15.0),

      child: ListView(
            children: [

              // start search and notification container (1)
                CustomAppBar(titleappbar: "Find Product", onPressedIcon: (){}, onPressedSearch: (){},),
             // end  search and notification container  (1) 

     // start first box (Discount%) (2)
     const CustomCardHome(title: "A Summer Surprise", body: "Discount 20%",),
     // end first box (Discount%)(2)

    // Start categories box 
const  CustomTitleHome(title: "Categories",),
// SizedBox(height: 10.0,),
     const ListCategoriesHome(),
   
    // End categories box 

    // Start Product for you 
     
  //  const SizedBox(height: 10.0), 
    
    // start title item
     const  CustomTitleHome(title: "Product For You",),
    // end title item
   //  SizedBox(height: 10.0,),
       // start items image
      const ListItemsHome(),
      // end items image

 // start offers box
     const  CustomTitleHome(title: "offers",),
 //    SizedBox(height: 10.0,),  
      const ListItemsHome(),
 // end offers box

    


      
    ],),
    ),)

    );
   
    
    
  }
}