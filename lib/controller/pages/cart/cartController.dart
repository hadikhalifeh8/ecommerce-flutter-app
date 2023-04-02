import 'dart:math';

import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponModel.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ProductDetails مع صفحة 


class CartController extends GetxController
{

  TextEditingController? controllertCoupon; 
   CouponModel? couponModel;
   int? discountCoupon = 0; //discountCoupon متغير 
   String? couponName;     // nameCoupon متغير 


CartData cartData = CartData(Get.find());
late StatusRequest statusRequest;
MyServices myServices = Get.find();







//*************To Cart Page Only (View Cart Page)******************************** */
List<CartModel> data = [];

// List<CouponModel> dataCoupon = [];



// barrat list [data]
double totalSumOfPrice = 0.0;
int totalcountitemsQNTY = 0;
 // int totalcountOfSpecificItems = 0;



//  String? itemsid;

viewcart()async{

      statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //refresh page لل 
      update();
      //refresh page لل
      var response = await cartData.cartView(myServices.sharedPreferences.getString("id")); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      // start backend
      if(response['status'] == "success")
      {
        List dataresponse = response['data'];

     // 5arej list data [...] { map}
    
    //   "dataSpecificSumandCountOfItems": {
    //     "sumofallItemsbyuser": 4300,
    //     "totalcountOfItems": 3
    //     "totalcountOfSpecificItems": 1  
    // }
        Map dataresponseSumPrice = response['dataSpecificSumandCountOfItems'];
      data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));

         totalSumOfPrice = double.parse(dataresponseSumPrice['sumofallItemsbyuser'].toString());
        totalcountitemsQNTY = int.parse(dataresponseSumPrice['totalcountOfallitemsItemsQNTY'].toString());
        
        // totalcountOfSpecificItems = int.parse(dataresponseSumPrice['totalcountOfSpecificItems'].toString());
        //   totalcountOfSpecificItems = dataresponseSumPrice['totalcountOfSpecificItems'];
    
      }
      
     
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
  // end backend
     }
      update();
     
}

/// ********************************************************************************* */

// 1- reset 
//2- refresh إعادة تعيين للاسعار متل 
resetVariablesCart()
{
  totalcountitemsQNTY = 0;
  totalSumOfPrice = 0;
  data.clear();
}

refreshPage()
{
  resetVariablesCart();
  viewcart();
}
/// ********************************************************************************* */




//*************To Cart Page Only (View Cart Page)******************************** */



addCart(String itemsid)async {
          
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


deleteCart(String itemsid) async {
    
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

// ProductDetalsControllerImp بال  onInit getItemsCountCart  بعملها  لل
// getItemsCountCart(String itemsid) async { // عدد الكميه اللي حطيتها للمنتج (+ 1/2/3 -)
    
//                     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
//       //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
//       var response = await cartData.getItemsCountCart(myServices.sharedPreferences.getString("id"), itemsid); //loading هون خلص 

//      print("***************##############************* Controler $response ");
    
//      statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

//      if(StatusRequest.success == statusRequest)
//      {
//       if(response['status'] == "success")
//       {
// int countItem = 0;
        
//         //  data.addAll(response['data']);
//         countItem = int.parse(response['data'].toString());
//         print("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*");
//         print(countItem);
//         return countItem;
       

//       }
//       else{
//         statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
//       } 
//      }
// }

  checkCoupon() async
  {
        statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
          update();
      
      var response = await cartData.checkCoupon(controllertCoupon!.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
    
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      //start backend
      if(response['status'] == "success")
      {
  
       Map<String, dynamic> dataCoupon = response['MapData'] ; // get the map
      couponModel = CouponModel.fromJson(dataCoupon);
      
      discountCoupon = int.parse(couponModel!.discount.toString());
       couponName = couponModel!.name.toString();

      }
      else{ //failure ما في داعي ترجع  
        // statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      discountCoupon =0;
      couponName = null;
      
      } 
      // endbakend
     }
     update();
  }

  // get the total price with discountCoupon / shipping ...
  getTotalPrice()
  {
    return totalSumOfPrice - (totalSumOfPrice*discountCoupon! / 100);
  }








// late String itemsid;
@override
  void onInit() {
    controllertCoupon = TextEditingController();
     viewcart();
    super.onInit();
  }

}