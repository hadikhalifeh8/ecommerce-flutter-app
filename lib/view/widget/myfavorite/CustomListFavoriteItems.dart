import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/myFavorites/myfavoriteController.dart';


import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/functions/translateDatabase.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';

import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomListFavoriteItems extends GetView<MyFavoriteController>{
  
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteItems({Key? key, required this.myFavoriteModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // controller.goToProductDetailsPage(itemsModel);
      },
      child: Card(
        //  أقسام /  مربعات
        //      color: AppColor.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
// Hero : for animation
              Hero(
                tag: "${myFavoriteModel.id}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${myFavoriteModel.itemRltn!.image.toString()}",
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),

              // SizedBox(height: 5,),
              Text(
                translateDateBase(myFavoriteModel.itemRltn!.nameAr, myFavoriteModel.itemRltn!.nameEn),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),

              Text(
                translateDateBase(myFavoriteModel.itemRltn!.nameAr,
                    myFavoriteModel.itemRltn!.nameEn),
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
                  Text("${myFavoriteModel.itemRltn!.price}\$",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans")),

                          IconButton(onPressed: (){
                           controller.deleteFromFavorite(myFavoriteModel.id.toString());
                          },
                           icon: Icon(
                            Icons.delete_outline_outlined,
                            color: AppColor.primaryColor,
                           
                           )
                           )
                
                // GetBuilder<FavoriteController>(builder: (controller)=>
                //   IconButton(
                //       onPressed: () {
                //         if(controller.isFavorite[itemsModel.id] == 1)
                //         {
                //            controller.setFavorite(itemsModel.id, 0);
                //           // controller.removefavorite(itemsModel.categoryRltn!.id.toString(), itemsModel.id.toString());
                //            controller.removefavorite(itemsModel.id.toString());

                //         }else{
                //            controller.setFavorite(itemsModel.id, 1);
                //            controller.addFavorite(itemsModel.id.toString());

                           
                //         }
                //       },
                      //  icon: Icon(activefavorite ? Icons.favorite : Icons.favorite_border_outlined ,
                      // icon: Icon(
                      //    controller.isFavorite[itemsModel.id] == 1
                      //         ? Icons.favorite
                      //         : Icons.favorite_border_outlined,
                      //     color: AppColor.primaryColor)
                      //     ) 
                // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
