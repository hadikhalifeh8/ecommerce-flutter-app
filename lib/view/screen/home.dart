// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce/controller/pages/home/homecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/customappbar1.dart';
import 'package:ecommerce/view/widget/home/customTitleitemhome4.dart';
import 'package:ecommerce/view/widget/home/customcardhome2.dart';
import 'package:ecommerce/view/widget/home/listCategorieshome3.dart';
import 'package:ecommerce/view/widget/home/listItemshome5.dart';

 //HomeScreen هيدي الصفحه هيي جزء من صفحه ال 
 // هيي الصفحه الرئيسيه HomeScreen 

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   //  HomeControllerImp controller = Get.put(HomeControllerImp());
      Get.put(HomeControllerImp());
 
   
    return  GetBuilder<HomeControllerImp>(builder: (controller)=> 
     
  Container(
      padding:const EdgeInsets.symmetric(horizontal: 15.0),

      child: ListView(
            children: [

              // start search and notification container (1)
                CustomAppBar(titleappbar: "Find Product", 
            // Start search 
                mycontroller: controller.search,
              
               //automatically  من دون ما أضغط  search بس يمحي اللي كاتبه بال 
                onChanged: (val)
                { 
                 controller.checkSearch(val);
                },

             //    onPressedIcon: (){},

             //search بس يضغط على زر ال 
                 onPressedSearch: (){
                  controller.onSearchItems();
                 },
            //  End search 

                 onPressedIconFavorite: (){
                  Get.toNamed(AppRoute.myfavorite);
                  },
                 ),
             // end  search and notification container  (1) 

    HandlingDataView(statusRequest: controller.statusRequest, 
          widget:   controller.isSearch == false
   ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const[
       // start first box (Discount%) (2)
      CustomCardHome(title: "A Summer Surprise", body: "Discount 20%",),
     // end first box (Discount%)(2)

    // Start categories box 
  CustomTitleHome(title: "Categories",),
// SizedBox(height: 10.0,),
      ListCategoriesHome(),
   
    // End categories box 

    // Start Product for you 
     
  //  const SizedBox(height: 10.0), 
    
    // start title item
       CustomTitleHome(title: "Product For You",),
    // end title item
   //  SizedBox(height: 10.0,),
       // start items image
       ListItemsHome(),
      // end items image

 // start offers box
       CustomTitleHome(title: "offers",),
 //    SizedBox(height: 10.0,),  
       ListItemsHome(),
 // end offers box

    ],)
    
    : 
   // Container(child: Text("Searchh"),)
    ListItemsSearch(listdataModel: controller.listdata)
    )

 


      
  
  ],),
    ),

    );
   
    
    
  }
}


//************************************* START SERCH ************************************************* */
class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel> listdataModel;
  const ListItemsSearch({Key? key,required this.listdataModel,}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return ListView.builder(
      itemCount: listdataModel.length,
     
     // Listview.builder بما أنو رح تكون داخل (listview )
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // Listview.builder بما أنو رح تكون داخل (listview )

      itemBuilder: (context, index) =>
      
   //   Text(listdataModel[index].nameEn.toString()), 
        
        Card(child: Row(children: [
          Expanded(child: CachedNetworkImage(height: 100.0, width: 100.0,
            imageUrl: "${AppLink.imageItems}/${listdataModel[index].image.toString()}")),
          
          Expanded(flex: 2,  
            child: ListTile(
            title: Text(listdataModel[index].nameEn.toString()),
            //subtitle: Text(listdataModel[index].categoryRltn!.nameEn!) ,
            
 
            )
            ),

        ],),)
      );
   }
 }






//************************************* END SERCH ************************************************* */
