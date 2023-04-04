import 'package:ecommerce/controller/pages/checkout/checkoutController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/CheckOut/customCardAddress3.dart';
import 'package:ecommerce/view/widget/CheckOut/customCardDeliveryType2.dart';
import 'package:ecommerce/view/widget/CheckOut/customCardPaymentMethod1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   CheckOutController controller =  Get.put(CheckOutController());
    return Scaffold(
          appBar: AppBar(title: const Text("Check Out"),),

          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric( horizontal: 10.0),
            margin:  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),

            height: 40.0,
            decoration:const BoxDecoration(
                       color: AppColor.secoundColor,
          ), 
          child: const Text("CheckOut", style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),),

          body: GetBuilder<CheckOutController>(builder: (controller) => 

          HandlingDataView(statusRequest: controller.statusRequest, 
          widget:            Container(
            padding: const EdgeInsets.all(20.0),
            
            child: 
          ListView(children: [
            Text("Choose Payment Method", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
          
          const SizedBox(height: 10.0,),

          InkWell(onTap: (){
               controller.choosePaymentMethod("cach"); // cach=>value
          },
            child: CardPaymentMethodButtonsCheckOut(
              title: "Cach on Delivery", isActiveColor: controller.paymentMethod == "cach" ? true : false)
            ),


           const SizedBox(height: 10.0,),

          InkWell(onTap: (){
            controller.choosePaymentMethod("card"); // card=>val
          },
            child: CardPaymentMethodButtonsCheckOut(
                           title: "Payment Method",
                            isActiveColor:controller.paymentMethod =="card" ?true : false)),



          const SizedBox(height: 20.0,),
           Text("Choose Delivery Type", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
          
SizedBox(height: 10.0,),

       Row(children: [
        InkWell(onTap: (){
          controller.chooseDeliveryType("delivery_way");
        },
              child:  CardDeliveryType(
                                       title: "delivery", 
                      is_ActiveColor: controller.deliveryType =="delivery_way" ? true : false,
                      imageName: AppImageAsset.deliveryman1,
               ),),
       
          const SizedBox(width: 5.0,) ,

          InkWell(onTap: (){
            controller.chooseDeliveryType("mycar_way");
          },
            child: CardDeliveryType(
                            title: "Drive Thru", 
                   is_ActiveColor:controller.deliveryType == "mycar_way" ? true : false,
             imageName: AppImageAsset.driveThru))
          
       ],),

       const SizedBox(height: 10.0,),
 if(controller.deliveryType =="delivery_way")
      Column(
       
        
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [

         const Text("Shipping Address", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
       const SizedBox(height: 10.0,),

       Column(children: [

           ...List.generate( 
                        controller.dataAddress.length,   
                        
                        (index) =>   InkWell(
                          onTap: (){
                            controller.chooseShippingAddress(
                              "${controller.dataAddress[index].id}",
                            );
                           
                          },
                           child: GetCardShippingAddressToCheckoutPage(
                              title: "${controller.dataAddress[index].addressName}", 
                            subtitle: "${controller.dataAddress[index].city}" ",  " "${controller.dataAddress[index].street}",
                             isActive: "${controller.addressid}" == "${controller.dataAddress[index].id}" ? true : false),
                         ),
                           ),
      ],)

       ],)
     



          ]),
          ),)
 
          )
    );
  }
}