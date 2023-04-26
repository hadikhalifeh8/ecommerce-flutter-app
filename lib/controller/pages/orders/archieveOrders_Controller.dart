import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/archiveOrder_data.dart';
import 'package:ecommerce/data/datasource/remote/orders/pendingOrders_data.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  

ArchiveOrderData archiveOrderData= ArchiveOrderData(Get.find());
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
         return "Ready To picked up by Delivery Man"; //على الطريق delivery صارت الطلبيه مع عامل ال 
       
       }else if(val == "3"){
         return "On the Way"; // على الطريق
       }else{
        return "Archeive"; // بالأرشيف
       }
  
}





    getallArchiveOrders() async{
    data.clear(); //القديم select لحتى يمحي ال 
    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      update();

      var response = await archiveOrderData.getData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

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


// when admin approved for the order & get notifiction when i in the order page (refresh the page directly) 
  refreshOrder()
  {
    getallArchiveOrders();
  }




  




  @override
  void onInit() {
    getallArchiveOrders();
    super.onInit();
  }

}