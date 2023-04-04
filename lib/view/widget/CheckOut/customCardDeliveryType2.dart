import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  final String title;
  final bool is_ActiveColor; 
  final String imageName;


  const CardDeliveryType({Key? key, required this.title, required this.is_ActiveColor, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
              height: 120,
              width: 120,
             decoration: BoxDecoration(border: Border.all(),
              color: is_ActiveColor == true ? AppColor.primaryColor : Colors.white
           ), 
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(imageName, width: 80,),
             Text(title, style: TextStyle(
                 fontWeight: FontWeight.bold,
              color: is_ActiveColor == true ? Colors.white : AppColor.primaryColor),
              )

           ],),
            );
  }
}