import 'package:ecommerce/controller/pages/items/favoriteController.dart';
import 'package:ecommerce/controller/pages/items/itemsController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/view/widget/customappbar1.dart';
import 'package:ecommerce/view/widget/items/customListItems.dart';
import 'package:ecommerce/view/widget/items/listCategoriesItems.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Item_s extends StatelessWidget {
  const Item_s({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(ItemsControllerImp());
  FavoriteController controllerFav  = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        

        //ListView جوات ال  HandlingDataView ال 
        child:
        //  GetBuilder<ItemsControllerImp>(
        //   builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest,
        //  widget: 
         ListView(children: [
              
                  CustomAppBar(titleappbar: "Find Product",
                //   onPressedIcon: (){},
                   onPressedSearch: (){},
                   onPressedIconFavorite: (){Get.toNamed(AppRoute.myfavorite);},
                   ),
                   
                 const SizedBox(height: 15.0,),
                 const ListCategoriesItems(),
 GetBuilder<ItemsControllerImp>(
          builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest,
         widget:

                       GridView.builder(
                  //listview بقلب  gridview عشان 
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //listview بقلب  gridview عشان

                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7), 
                  
                  itemBuilder: (BuildContext context, index) {

                      // key => id of items                    =  value = active(1) / notactive(0)
  controllerFav.isFavorite[controller.data[index]['id']] = controller.data[index]['favorite'];

                      return  CustomListItems(
                                               // activefavorite: false,
                                              // favoritesModel:FavoritesModel.fromJson(controller.data[index]),
                                               itemsModel:ItemsModel.fromJson(controller.data[index]),
                                      );
                         })))
      ]),
      )
      );
    
  }
}