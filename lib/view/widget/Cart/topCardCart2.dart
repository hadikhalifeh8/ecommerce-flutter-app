import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String title;
  const TopCardCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
       title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
