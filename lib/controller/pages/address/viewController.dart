import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressModel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController{ 


AddressData addressData = AddressData(Get.find());
MyServices myServices = Get.find();


  // List data = [];
  List<AddressModel> data = [];

  late StatusRequest statusRequest;

     getData() async {
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await addressData.getData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         // data.addAll(response['data']);

         List listdata = response['data'];
         data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
         if(data.isEmpty){
      statusRequest = StatusRequest.failure;
      }
      }
      

      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



   deleteAddress(String addressid)
   {
    
      addressData.DeleteData(addressid);
      data.removeWhere((element) => element.id.toString() == addressid.toString());
      update();

   }









//function أول ما يفتح الصفحه تشتغل ال 
   @override
  void onInit() {
    getData();
    super.onInit();
  }
}