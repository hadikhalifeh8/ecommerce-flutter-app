import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';

class GetCardShippingAddressToCheckoutPage extends StatelessWidget {
 final String title;
 final String subtitle;
 final bool isActive;
  const GetCardShippingAddressToCheckoutPage({Key? key, required this.title, required this.subtitle, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(color: isActive ==true ? AppColor.secoundColor : Colors.white,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                              title: Text(title, style: TextStyle(color: isActive == true ? Colors.white : AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 18),),
                              subtitle: Text(subtitle, style: TextStyle(color: isActive == true ? Colors.white : AppColor.secoundColor, fontSize: 14)),
                              ),);
  }
}