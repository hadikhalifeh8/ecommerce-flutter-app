import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/Cart/cartbutton.dart';
import 'package:flutter/material.dart';

class CustomButtomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final double totalprice; 
  
  const CustomButtomNavigationBarCart({Key? key, required this.price, required this.shipping, required this.totalprice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            //color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text("price",  style: TextStyle(fontSize: 16)),),
         
          Container(
            padding:const  EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("$price \$", style:const  TextStyle(fontSize: 16),)),
         ],),


            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            //color: Colors.red,
            padding: const  EdgeInsets.symmetric(horizontal: 20.0),
            child: const  Text("Shipping",  style: TextStyle(fontSize: 16)),),
         
          Container(
            padding: const  EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("$shipping \$", style:const  TextStyle(fontSize: 16),)),
         ],),

          const  Divider(color: Colors.black,),

            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            //color: Colors.red,
            padding: const  EdgeInsets.symmetric(horizontal: 20.0),
            child: const  Text("Total Price",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.primaryColor)),),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("$totalprice \$", style: const  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
         ],),
         

       

        const  SizedBox(height: 10.0,),
        CustomButtonCart(textbuttonName: "place Order", onPressed: (){},)
      ],),
    );
  }
}