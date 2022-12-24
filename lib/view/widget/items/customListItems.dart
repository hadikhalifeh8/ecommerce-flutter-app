import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

                     return InkWell(
                      child: Card( 
                         //  أقسام /  مربعات
                //      color: AppColor.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column( 
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                  
                        children: [
                        CachedNetworkImage(imageUrl: "${AppLink.imageItems}/${itemsModel.image!}",  height: 130,fit: BoxFit.fill,),
                       // SizedBox(height: 5,),
                        Text(itemsModel.nameEn!, style: const TextStyle(color: AppColor.black, fontSize: 16.0, fontWeight: FontWeight.bold),),

                        Text(itemsModel.categoryRltn!.nameEn!, textAlign: TextAlign.center,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Rating 3.5", textAlign: TextAlign.center,),
                         //  Icon(Icons.star),
                       Container(
                        // color: Colors.red,
                        height: 25,
                        alignment: Alignment.bottomCenter,

                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ...List.generate(5, (index) =>
                             const Icon(Icons.star, size: 15,)
                          )
                         ],),
                       )

                        ],),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("${itemsModel.price}\$", style: TextStyle(color: AppColor.primaryColor, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "sans")),
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: AppColor.primaryColor))
                      ],)
                      ],
                      
                      ),
                    ),

                      ),

                  
                      );

                 
  }
}