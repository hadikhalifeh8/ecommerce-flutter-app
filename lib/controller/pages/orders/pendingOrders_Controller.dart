import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/pendingOrders_data.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  

OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
List<OrdersModel> data = [];
 MyServices myServices = Get.find();

late StatusRequest statusRequest; 


printOrderType(String val){
    if(val == "0")
    {
          return "delivery";
    }else {
         return "Recive / personal car";
       }

}


printPaymentMethod(String val){

  if(val =="0")
    {
          return "Cach";
    }else{
         return "Payment Card";
       }
  
}


printOrderStatus(String val){
  if(val == "0")
    {
          return "Await Approve"; // إنتظار الموافقه
   
    }else if(val == "1"){
         return "The Order is being Prepared"; // تجهيز
       
       }else if(val == "2"){
         return "On the Way"; // على الطريق
       
       }else{
        return "Archeive"; // بالأرشيف
       }
  
}





    getallPendingOrders() async{
    data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await ordersPendingData.getData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

     print("***************##############************* Controler $response ");
    // print(category_id);
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         // data.addAll(response['data']);
         List listdata = response['data'];
         data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
      update(); // Refresh 
  }

  @override
  void onInit() {
    getallPendingOrders();
    super.onInit();
  }

}