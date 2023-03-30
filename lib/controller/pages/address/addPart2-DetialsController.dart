import 'dart:async';

import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPartTwoController extends GetxController{



  AddressData addressData = AddressData(Get.find());

  List data = [];

  MyServices myServices = Get.find();


  TextEditingController? name ;
  TextEditingController? city ;
  TextEditingController? street ;
  

  StatusRequest statusRequest = StatusRequest.none;

  String? lat;
  String? long;

  initialData()
  {

    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();


     lat = Get.arguments['lat'];
     long = Get.arguments['long'];

     print("###LAT: ### $lat");
     print("###LONG: ### $long");

  }


  // add city/street/nameofaddress 
     addAddress() async {
      update();
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await addressData.addData(
                   myServices.sharedPreferences.getString("id")!,
                   name!.text, 
                   city!.text,
                   street!.text,
                   lat!, 
                   long!
       ); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         // data.addAll(response['data']);
         Get.offAllNamed(AppRoute.homepage);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



      @override
  void onInit() {
    initialData();
      Completer<GoogleMapController>();
    super.onInit();
  }
}