import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/home/productDetailscontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPageProductDetailsImage extends GetView<ProductDetalsControllerImp> {
  const TopPageProductDetailsImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Stack(
          //  fit: StackFit.passthrough,
          clipBehavior:  Clip.none, //container لتسمح للصوره تنزل تحت ال 
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                height: 200,
               decoration: BoxDecoration(
                color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(50.0),
                ),
                 ),
          
              Positioned(
                top: 80,
                right: Get.width /8,  //50,
                left: Get.width /8,  //50,
                child:
                 Hero(
                  tag: "${controller.itemsModel.id}",
                   child: CachedNetworkImage(imageUrl: "${AppLink.imageItems}/${controller.itemsModel.image!}", 
                   fit: BoxFit.fill,
                                 height: 150,
                                 ),
                 ),
         ) ],
          );
  }
}