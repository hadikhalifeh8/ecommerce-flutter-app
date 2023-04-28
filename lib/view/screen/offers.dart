import 'package:ecommerce/controller/pages/items/favoriteController.dart';
import 'package:ecommerce/controller/pages/offers/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/customappbar1.dart';
import 'package:ecommerce/view/widget/items/customListItems.dart';
import 'package:ecommerce/view/widget/offers/customListItemsOffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController()); 
  FavoriteController controllerFav  = Get.put(FavoriteController());
    
    
    return GetBuilder<OffersController>(builder: (controller) => 
       ListView(children: [
         Center(child: Text("Offers", style: TextStyle(color: AppColor.primaryColor, fontSize: 22,fontWeight: FontWeight.bold),),),



            //           // start search and notification container (1)
                 //CustomAppBar(titleappbar: "Find Product", 
            // Start search 
              //  mycontroller: controller.search,
              
               //automatically  من دون ما أضغط  search بس يمحي اللي كاتبه بال 
                // onChanged: (val)
                // { 
                //  controller.checkSearch(val);
                // },

             //    onPressedIcon: (){},

             //search بس يضغط على زر ال 
                //  onPressedSearch: (){
                //   controller.onSearchItems();
                //  },
            //  End search 

                //  onPressedIconFavorite: (){
                //   Get.toNamed(AppRoute.myfavorite);
                //   },
                 //),
             // end  search and notification container  (1) 
        
          HandlingDataView(
                         statusRequest: controller.statusRequest,
                         widget: ListView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,

                          
                          itemCount: controller.data.length,
                          itemBuilder: ((context, index) => 

                               CustomListItemsOffer(
                            itemsModel:  controller.data[index]
                                               // activefavorite: false,
                                              // favoritesModel:FavoritesModel.fromJson(controller.data[index]),
                                              // itemsModel:ItemsModel.fromJson(controller.data[index]),
                                      )
                          
                         )))
       ],)
    );
  }
}