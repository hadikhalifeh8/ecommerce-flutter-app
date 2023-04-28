import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

   getData() async {
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await offersData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        List listdata = response['data'];
         data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
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