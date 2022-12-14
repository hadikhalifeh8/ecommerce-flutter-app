// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  
  final bool activecolor ;
  

  

   const CustomButtonAppBar({
    Key? key,
   required this.onPressed, required this.textbutton, required this.icondata,  required this.activecolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialButton(onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icondata, color:activecolor == true? AppColor.primaryColor : AppColor.grey2,),
            Text(textbutton, style: TextStyle(color:activecolor == true? AppColor.primaryColor : AppColor.grey2),),
         
          ],
        ),
        );
  }
}
