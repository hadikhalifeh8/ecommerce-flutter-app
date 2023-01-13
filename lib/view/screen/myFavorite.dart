import 'package:ecommerce/controller/pages/myFavorites/myfavoriteController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:ecommerce/view/widget/customappbar1.dart';
import 'package:ecommerce/view/widget/myfavorite/CustomListFavoriteItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
        
        child: 
               GetBuilder<MyFavoriteController>(builder: ((controller) => 
                ListView(children: [
         // start search and notification container (1)
                CustomAppBar(titleappbar: "Find Product", 
                 onPressedIcon: (){},
                 onPressedSearch: (){},
                 onPressedIconFavorite: (){ Get.toNamed(AppRoute.myfavorite); },
                 ),
             // end  search and notification container  (1) 
      
      SizedBox(height: 10.0,),
       
      HandlingDataView(statusRequest: controller.statusRequest, 
               widget:GridView.builder(
                
                shrinkWrap: true,  
                physics: const NeverScrollableScrollPhysics(), //listview منها عشان ما يصير في تضارب مع  scroll بلغي ال

                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7), 
               itemBuilder: (context, index){
                // return  Text(controller.data[index].itemRltn!.nameEn.toString()); // طريقه جديده
                return CustomListFavoriteItems(myFavoriteModel: controller.data[index]);
               }
               
               ) 
               )
      
               ],)
               )),
    ));
  }
}