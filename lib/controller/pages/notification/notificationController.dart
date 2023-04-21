import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{


  NotificationData notificationData = NotificationData(Get.find());

  List data = [];
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;



   getData() async {
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     
     var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         data.addAll(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }


   @override
  void onInit() {
    getData();
    super.onInit();
  }
}