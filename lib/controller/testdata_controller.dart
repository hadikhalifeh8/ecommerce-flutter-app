import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

   getData() async {
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await testData.getData(); //loading هون خلص 

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