import 'package:ecommerce/controller/pages/cart/cartController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';

import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetalsController extends GetxController{
  
}
  class ProductDetalsControllerImp extends ProductDetalsController{
   
   // CartController cartController = Get.put(CartController());

     late ItemsModel itemsModel;
     late StatusRequest statusRequest;
   
MyServices myServices = Get.find();
CartData cartData = CartData(Get.find());



    int countitems  = 0; 



List subitems = [ // colors list
 {"name" : "red", "id" : 1 , "active" : 1},
  
  {"name" : "black", "id" : 2 ,  "active" : 0},

  {"name" : "blue", "id" : 3 ,  "active" : 0}
];




getItemsCountCart(String itemsid) async { // عدد الكميه اللي حطيتها للمنتج (+ 1/2/3 -)
    
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await cartData.getItemsCountCart(myServices.sharedPreferences.getString("id"), itemsid); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
int countItem = 0;
        
        //  data.addAll(response['data']);
        countItem = int.parse(response['data'].toString());
        print("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*");
        print(countItem);
        return countItem;
       

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
}







addCartitems(String itemsid)async {
          
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
                    update();
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await cartData.addcart(myServices.sharedPreferences.getString("id"), itemsid); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      //start backend
      if(response['status'] == "success")
      {
        //  data.addAll(response['data']);
        Get.rawSnackbar(title: "إشعار", messageText: const Text("لقد تم إضافة المنتج إلى السله"));

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
      //end backend
     }
     update();

}


deleteCartitems(String itemsid) async {
    
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
                    update();
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await cartData.deletecart(myServices.sharedPreferences.getString("id"), itemsid); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      //start backend
      if(response['status'] == "success")
      {
        int countItem = 0;

      
        Get.rawSnackbar(title: "إشعار", messageText: const Text("لقد تم إزالة المنتج من السله"));
        
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
      // endbakend
     }
     update();
}






addcounter() // بس إكبس + بزيد رقم
{
  // addCartitems(itemsModel.id.toString());
  countitems ++ ;
  update();
}

removecounter() // بس إكبس - بنقص رقم
{
  if(countitems > 0)
    {
 
  // deleteCartitems(itemsModel.id.toString());

       countitems -- ;
      update();
    }
 
}



  goToCartPage() {
   Get.toNamed(AppRoute.mycart);
   update();
  }


initialData() async{
statusRequest = StatusRequest.loading;

itemsModel = Get.arguments['itemsModel'];
countitems = await getItemsCountCart(itemsModel.id.toString());
statusRequest = StatusRequest.success;

update();
}

@override
  void onInit() {
    initialData();
    super.onInit();
  }
  
}