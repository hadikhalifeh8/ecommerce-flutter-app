import 'dart:async';

import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController{

  StatusRequest statusRequest = StatusRequest.loading;

   Completer<GoogleMapController>? completercontroller ;
   Position? position;
 CameraPosition? kGooglePlex;

 
 List<Marker> markers = [];

 double? lat;
 double? long;
  

  // أول ما بتفتح الخريطه بيعطيني الموقع اللي أنا في
getCurrentLocation()async{
                     position = await Geolocator.getCurrentPosition();
                     kGooglePlex =  CameraPosition(
                      target: LatLng(position!.latitude, position!.longitude),
                      zoom: 14.4746,
                      );
                      statusRequest = StatusRequest.none;
                      update();
       }

 //List على  marker بضفلي 
   addMarker(LatLng latLng)
   {
    markers.clear();
      markers.add(Marker(markerId: MarkerId("1"), position: latLng)); // positiion: المكان اللي أنا ضغطت عليه
      
      lat = latLng.latitude;
      long = latLng.longitude;
        update();
   }   


   goToAddaddressPage2()
   { 
    if(long == null && lat ==null ) 
    return Get.snackbar(backgroundColor: Colors.red,colorText: Colors.white,
       "warning", "please  mark a Location");
    

              Get.toNamed(AppRoute.addressaddpart2,
                  arguments:{
                               'lat' : lat.toString(),
                               'long' : long.toString(),
                    });
     } 





      @override
  void onInit() {
    getCurrentLocation();
      Completer<GoogleMapController>();
    super.onInit();
  }
}