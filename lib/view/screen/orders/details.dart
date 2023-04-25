import 'package:ecommerce/controller/pages/orders/detailsOrder_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsOrderController controller = Get.put(DetailsOrderController());
    return Scaffold(
      appBar: AppBar(title: Text("Orders Details"),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
       
        child: GetBuilder<DetailsOrderController>(builder: (controller) => 
        
        HandlingDataView(statusRequest: controller.statusRequest,
         widget: ListView(children: [
                            
                Card( child: 
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Table(children: [

                                TableRow(children: [
                        Text("Item", textAlign: TextAlign.center, style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold,fontSize: 16.0),),
                        Text("QTY", textAlign: TextAlign.center, style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
                        Text("Price", textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
                                    ]),  

                                  //       TableRow(children: [
                                  // Text("Iphone", textAlign: TextAlign.center,),
                                  // Text("1", textAlign: TextAlign.center,),
                                  // Text("600", textAlign: TextAlign.center,),
                                  //   ]),

                             ...List.generate(controller.data.length,
                              (index) =>       TableRow(children: [
                                  Text("${controller.data[index].itemRltn!.nameEn.toString() }", textAlign: TextAlign.center,),
                                  Text("${controller.data[index].itemRltn!.cartQty.toString()}", textAlign: TextAlign.center,),
                                  Text("${controller.data[index].itemRltn!.price.toString()}", textAlign: TextAlign.center,),
                                    ]), )   
          ],),
            Center(child: Text("Total price: ${controller.ordersModel.totalPrice}\$", style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold,fontSize: 20.0))),
                      ],
                    ),
                  ),
                ),
         
          
        
           
if(controller.ordersModel.orderType =="0")
           Card(child: ListTile(
            title:const Text("Shipping Address", style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold,fontSize: 16.0)),
            subtitle:Text("${controller.ordersModel.addressRltn!.city.toString()}, " "${controller.ordersModel.addressRltn!.addressName.toString()}")
           ),
           ),


// Google Map
if(controller.ordersModel.orderType =="0")
           Card(
             child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
           
                    height: 300,
                    width: double.infinity,
              
              child:     GoogleMap(
                                     mapType: MapType.normal,
           
                                     markers: controller.markers.toSet(),
                                
           
                                     initialCameraPosition:  controller.kGooglePlex!,// 
                                     onMapCreated: (GoogleMapController controllermap) {
                                       controller.completercontroller?.complete(controllermap);
                                     },
                                   ),
              ),
           )
        ]),)
        )
      ),
    );
  }
}