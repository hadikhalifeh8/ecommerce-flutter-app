import 'package:ecommerce/controller/pages/cart/cartController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/Cart/cartbutton.dart';
import 'package:ecommerce/view/widget/Cart/customCartItemsList3.dart';
import 'package:ecommerce/view/widget/Cart/custom_Buttom_NavigationBar_Cart4.dart';
import 'package:ecommerce/view/widget/Cart/topAppBarCart1.dart';
import 'package:ecommerce/view/widget/Cart/topCardCart2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller =  Get.put(CartController());

    return Scaffold(
  //  bottomNavigationBar:  CustomButtomNavigationBarCart(price: "1800", shipping: "1200", totalprice: "2200"),

    bottomNavigationBar:GetBuilder<CartController>(builder: (cartcontroller)=>  CustomButtomNavigationBarCart(price: "${cartcontroller.totalSumOfPrice}", shipping: "1200", totalprice: cartcontroller.totalSumOfPrice)),

    

      body: GetBuilder<CartController>(builder: (cartcontroller)=> HandlingDataView(statusRequest: cartcontroller.statusRequest,
       widget: ListView(
        children:  [
    
    const TopAppBarCart(title: "My Cart"),

     const SizedBox(height: 5,),
   
     TopCardCart(title: "You have ${cartcontroller.totalcountitemsQNTY} items in Your List"),
      
   //   SizedBox(height: 2.0,),


  ...List.generate(
                   cartcontroller.data.length, 
                   (index) =>


                  
               CustomCartItemsList(
                onAddPress: () async { 
                await  cartcontroller.addCart(cartcontroller.data[index].itemRltn!.id.toString(),);
                  cartcontroller.refreshPage();
                  //cartcontroller.addcounter();
                 }, 
               onMinusPress: () async{ 
                await cartcontroller.deleteCart(cartcontroller.data[index].itemRltn!.id.toString(),);
                  cartcontroller.refreshPage();
                    
                },


                imagename: cartcontroller.data[index].itemRltn!.image.toString(),
                name: cartcontroller.data[index].itemRltn!.nameEn.toString(), 
               price: cartcontroller.data[index].itemRltn!.itemspricediscount.toString(),
              // price: (cartcontroller.itemsModel.price!-(cartcontroller.itemsModel.price*cartcontroller.itemsModel.discount /100)) 
              //  count: cartcontroller.data[index].itemRltn!.count.toString()
              count: cartcontroller.data[index].itemRltn!.cartQty.toString(),
               
               ),
                   )

//CustomCartItemsList(name: "Laptop 2", price: "1400.0\$", count: "1"),


      ]
      ,),)));
    
  }
}