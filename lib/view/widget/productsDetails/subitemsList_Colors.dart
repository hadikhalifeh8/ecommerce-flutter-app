import 'package:ecommerce/controller/pages/home/productDetailscontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsListColors extends GetView<ProductDetalsControllerImp> {
  const SubItemsListColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(controller.subitems.length, (index) => 
                   Container(
                    
                    margin: const EdgeInsets.only(right: 5.0, left: 5.0),
              
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 5.0),
              height: 60.0 , width: 80.0,
              decoration: BoxDecoration(border: Border.all(color: AppColor.fourthColor),
               borderRadius: BorderRadius.circular(10),
               
               color:controller.subitems[index]['active'] == 1 ?AppColor.fourthColor  : Colors.white,  // box color
              ),
        
        child: Text(controller.subitems[index]['name'], style:  TextStyle(
                        color: controller.subitems[index]['active'] == 1 ? Colors.white  :AppColor.fourthColor, // name color
                         fontWeight: FontWeight.bold),),
               ),
              
              )
              ],
           );
  }
}