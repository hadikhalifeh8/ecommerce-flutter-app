import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/items/favoriteController.dart';
import 'package:ecommerce/controller/pages/items/itemsController.dart';
import 'package:ecommerce/controller/pages/offers/offers_controller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translateDatabase.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffer extends GetView<OffersController>{
  
  final ItemsModel itemsModel;
   // final FavoritesModel favoritesModel;
  // final bool activefavorite;
  
  const CustomListItemsOffer({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   
    return InkWell(
      onTap: () {
        // controller.goToProductDetailsPage(itemsModel);
      },
      child: Card(
        //  أقسام /  مربعات
              //color: AppColor.primaryColor,
        child: Stack(
          children: [
            Padding(
               padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
// Hero : for animation
                  Hero(
                    tag: "${itemsModel.id}",
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.imageItems}/${itemsModel.image!}",
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),

                  // SizedBox(height: 5,),
                  Text(
                    translateDateBase(itemsModel.nameAr!, itemsModel.nameEn.toString()),
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    translateDateBase(itemsModel.categoryRltn!.nameAr.toString(),
                        itemsModel.categoryRltn!.nameEn.toString()),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rating 3.5",
                        textAlign: TextAlign.center,
                      ),
                      //  Icon(Icons.star),
                      Container(
                        // color: Colors.red,
                        height: 25,
                        alignment: Alignment.bottomCenter,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //أكبر من 0 discount إذا في 
                      // Text("${itemsModel.price}\$",
                    

                   Text("${(itemsModel.itemspricediscount)}\$",
                                //  Text("${itemsModel.price}\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),

                              if(itemsModel.discount! > 0)
                              Text("${itemsModel.price}\$",style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12, fontWeight: FontWeight.bold)
                              ),
                          
                      
                    
                              
                    
                    GetBuilder<FavoriteController>(builder: (controller)=>
                      IconButton(
                          onPressed: () {
                            if(controller.isFavorite[itemsModel.id] == 1)
                            {
                               controller.setFavorite(itemsModel.id, 0);
                              // controller.removefavorite(itemsModel.categoryRltn!.id.toString(), itemsModel.id.toString());
                               controller.removefavorite(itemsModel.id.toString());

                            }else{
                               controller.setFavorite(itemsModel.id, 1);
                               controller.addFavorite(itemsModel.id.toString());

                               
                            }
                          },
                          // icon: Icon(activefavorite ? Icons.favorite : Icons.favorite_border_outlined ,
                          icon: Icon(
                             controller.isFavorite[itemsModel.id] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor)
                              ) 
                    )
                    ],
                  ),
                  //أكبر من 0 discount إذا في 
          //   if(itemsModel.discount! > 0)
          //  Text("-${itemsModel.discount}%",style: TextStyle(fontSize: 20),
          // )
                 ],
              ),
            ),
           
//أكبر من 0 discount إذا في 
if(itemsModel.discount! > 0)
Positioned(
            top: 3,
             left: 3,
          child: Image.asset(AppImageAsset.offer, width: 35,),
),



          ],
        ),
      ),
    );
  }
}
