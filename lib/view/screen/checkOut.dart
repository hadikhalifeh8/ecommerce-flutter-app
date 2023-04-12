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
          child: MaterialButton(onPressed: (){
            controller.checkout();
          }, 
          child:const Text("CheckOut", style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
          ,),

          body: GetBuilder<CheckOutController>(builder: (controller) => 

          HandlingDataView(statusRequest: controller.statusRequest, 
          widget:            Container(
            padding: const EdgeInsets.all(20.0),
            
            child: 
          ListView(children: [
           const Text("Choose Payment Method", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
          
          const SizedBox(height: 10.0,),

          InkWell(onTap: (){
               controller.choosePaymentMethod("0"); // cach=>value
               print("cach");

          },
            child: CardPaymentMethodButtonsCheckOut(
              title: "Cach on Delivery", isActiveColor: controller.paymentMethod == "0" ? true : false)
            ),


           const SizedBox(height: 10.0,),

          InkWell(onTap: (){
            controller.choosePaymentMethod("1"); // card=>val
            print("card");
          },
            child: CardPaymentMethodButtonsCheckOut(
                           title: "Payment Method",
                            isActiveColor:controller.paymentMethod =="1" ?true : false)),



          const SizedBox(height: 20.0,),
          const Text("Choose Delivery Type", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
          
const SizedBox(height: 10.0,),

       Row(children: [
       
        InkWell(onTap: (){
          controller.chooseDeliveryType("0");
          print("delivery_way");
        },
              child:  CardDeliveryType(
                                       title: "delivery", 
                      is_ActiveColor: controller.deliveryType =="0" ? true : false,
                      imageName: AppImageAsset.deliveryman1,
               ),),
       
          const SizedBox(width: 5.0,) ,

          InkWell(onTap: (){
            controller.chooseDeliveryType("1");
          print("mycar_way");

          },
            child: CardDeliveryType(
                            title: "Drive Thru", 
                   is_ActiveColor:controller.deliveryType == "1" ? true : false,
             imageName: AppImageAsset.driveThru))
          
       ],),

       const SizedBox(height: 10.0,),
 if(controller.deliveryType =="0")//delivery_way
      Column(
       
        
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [

         const Text("Shipping Address", style: TextStyle(color: AppColor.secoundColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
       const SizedBox(height: 10.0,),
  
         
              
            
       Column(children: [
         if(controller.dataAddress.length == 0)
          Text("please add your address First", style: TextStyle(color: Color.fromARGB(255, 64, 0, 212), fontSize: 16.0),),

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