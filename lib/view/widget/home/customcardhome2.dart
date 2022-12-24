import 'package:ecommerce/controller/pages/home/homecontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          Container(
          margin: EdgeInsets.symmetric( vertical: 15.0), 
          child: Stack(children: [
          Container(height: 150,
          alignment: Alignment.center ,
          
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: AppColor.primaryColor,),
         
         child: ListTile(
            
               title: Text(title,
                           style: const TextStyle(color: Colors.white, fontSize: 20.0),),
           
               subtitle: Text(body, 
                           style: const TextStyle(color: Colors.white, fontSize: 30.0),),
          ),
          ), 
         
          Positioned(
            top: -20,
            right:controller.lang =='en' ? -20 : null, // -20
            left: controller.lang =='ar' ? -20 : null,  // -20
            bottom: -20,

            child: Container(height: 160,width: 160, 
            decoration: BoxDecoration(color: AppColor.secoundColor,
            borderRadius: BorderRadius.circular(160)
            ),
            
             ),
          )
         ]),
         );
  }
}