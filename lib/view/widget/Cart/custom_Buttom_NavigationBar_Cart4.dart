import 'package:ecommerce/controller/pages/cart/cartController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/couponModel.dart';
import 'package:ecommerce/view/widget/Cart/customButton_coupon_in_ButtomBar.dart';
import 'package:ecommerce/view/widget/Cart/custombuttonCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomNavigationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final double totalprice; 
  final String shipping;

  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;
  
  const CustomButtomNavigationBarCart({Key? key, required this.price, required this.discount, required this.totalprice, required this.controllerCoupon, required this.onApplyCoupon, required this.shipping, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // coupon textform and button
          // if coupon exist ok / true hide the textform and button and calculate the price discount

          // GetBuilder: change the front
         GetBuilder<CartController>(builder: (controller) => 

          (controller.couponName == null) ?
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            
            child: Row(children: [
            Expanded(flex: 1,
                   child: TextFormField(

                    controller: controllerCoupon,
                  
                         decoration: const InputDecoration(
                          hintText: "  Coupon Code",
                          isDense: true, //box بتصغر الحجم تاع ل
                          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),//box بتصغر الحجم تاع ل
                         
                          border: const OutlineInputBorder())
                          
                         )),
                         
            Expanded(child: CustomButtonCoupon(
                                        textbuttonName: "apply",
                                        onPressed: onApplyCoupon,
             ))
          ],),
          ): Text("coupon code: ${controller.couponName}", style: TextStyle(color: AppColor.primaryColor, fontSize: 16),)
          ,),


         
         // container of price / shipping / total price
          Container(
            padding: const EdgeInsets.all(10.0),
            margin:  const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color:AppColor.primaryColor,width: 2),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: 
          Column(children: [
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
            child: const  Text("discount",  style: TextStyle(fontSize: 16)),),
         
          Container(
            padding: const  EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("$discount %", style:const  TextStyle(fontSize: 16),)),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("$totalprice \$", style: const  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
         ],),
        ],),),
          
         
         
         

       

        const  SizedBox(height: 10.0,),
        CustomButtonCart(textbuttonName: "place Order", onPressed: (){Get.toNamed(AppRoute.checkout);},)
      ],),
    );
  }
}