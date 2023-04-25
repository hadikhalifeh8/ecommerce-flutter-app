import 'dart:async';

import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/orders/detailsOrder_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsOrderController extends GetxController{

//to get itemsCartData
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<CartModel> data = [];



//to get address
  late  OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.loading;
   Completer<GoogleMapController>? completercontroller ;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];


  initialData()
  {
    // if the order type is by car => not showing address and map marker
      if(ordersModel.orderType =="0"){ 

         kGooglePlex =  CameraPosition(
                      target: LatLng(double.parse(ordersModel.addressRltn!.adressLatitude.toString()), double.parse(ordersModel.addressRltn!.adressLongitude.toString())),
                      zoom: 14.4746,
                      );

      markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(double.parse(ordersModel.addressRltn!.adressLatitude.toString()), double.parse(ordersModel.addressRltn!.adressLongitude.toString()
        )
        ),
      )  
      ); 

}
   

  }


  // get the dataItems in cart according to the order_id
     getDataItems() async {
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await orderDetailsData.getData(ordersModel.id.toString()); //loading هون خلص 
update();
     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        List listdata = response['data'];
         data.addAll(listdata.map((e) => CartModel.fromJson(e)));
         // data.addAll(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



@override
  void onInit() {
    //  Model_Of_Order_list =جديده function  أحسن ما إعمل  get  من ال  List  بجيب ال 
   ordersModel = Get.arguments['Model_Of_Order_list']; // from pendingOrderpage(button Details)
  getDataItems();
  initialData();
    super.onInit();
  }
}