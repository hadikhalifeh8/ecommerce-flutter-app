import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodButtonsCheckOut extends StatelessWidget {
  final String title;
  final bool isActiveColor;
  const CardPaymentMethodButtonsCheckOut({Key? key, required this.title, required this.isActiveColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
           
            padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 10.0),
            margin:  const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                       color: isActiveColor ==true ? AppColor.secoundColor : AppColor.primaryColor,
                       borderRadius: BorderRadius.circular(15),
                       ),

            child:  Text(title , style: TextStyle(color:isActiveColor ==true ? Colors.white : AppColor.secoundColor, height: 1),),
            );
  }
}