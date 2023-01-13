import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class FavoriteController extends GetxController {
  
  FavoriteData favoriteData = FavoriteData(Get.find());

List data = [];
late StatusRequest statusRequest ;
MyServices myServices = Get.find();


  // MAp =>key && values
  
  // key =>id of items;
  // value = active(1) / notactive(0)

  // Map isFavorite = {};
  // favorite['2'] = 1;
  // favorite['5'] = 0;

  // return 

 //favorite
  //{
     // 2:1,
     // 5:0
  //} 


  Map isFavorite = {};


  setFavorite(id, val){
    isFavorite[id] = val;
    update();
  }


  addFavorite(String itemsid) async {
        data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await favoriteData.addFavorite(myServices.sharedPreferences.getString("id"), itemsid); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        //  data.addAll(response['data']);
        Get.rawSnackbar(title: "إشعار", messageText: const Text("لقد تم إضافة المنتج إلى المفضله"));

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
     // update(); // Refresh
  }


  removefavorite(String itemsid) async {
  //removefavorite(String? favoritid_) async {

         data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await favoriteData.deleteFavorite(myServices.sharedPreferences.getString("id"), itemsid); // loading هون خلص 

     print("***************##############************* Controler $response ");
   
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        Get.rawSnackbar(title: "إشعار", messageText: const Text("لقد تم حذف المنتج من المفضله"));
       //   data.addAll(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
    // update(); // Refresh
  }
}