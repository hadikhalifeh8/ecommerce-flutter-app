

import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class CustomButton_Shared extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton_Shared({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          margin: const EdgeInsets.only(top: 7.0, right: 30.0, left: 30.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            onPressed: onPressed,
            color: AppColor.primaryColor,
            textColor: Colors.white,
            child: Text(text, style: TextStyle(fontSize: 20),),
          
        ),
      
    );
  }
}
