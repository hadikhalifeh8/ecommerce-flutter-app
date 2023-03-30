// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class MyFavoriteController extends GetxController {
  
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

// طريقه جديده
List<MyFavoriteModel> data = [];
late StatusRequest statusRequest ;
MyServices myServices = Get.find();


 


 


  myFavoritegetData() async {
        data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     
      var response = await myfavoriteData.myFavoritegetData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      // start backend
      if(response['status'] == "success")
      {
        //  data.addAll(response['data']);
        // طريقه جديده
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
       
       print("dataaaaaaaaaa");

       print(data);

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
      update(); // Refresh
  }






    deleteFromFavorite(String favorite_id)  { // without async / awit  delete directly
        
      var response = myfavoriteData.deleteData(favorite_id); //loading هون خلص 

    //  data.removeWhere((element) => element.id == favorite_id);

      data.removeWhere((element) => element.id.toString() == favorite_id.toString());

      update(); // Refresh
  }







@override
  void onInit() {
    myFavoritegetData();
    super.onInit();
  }


}