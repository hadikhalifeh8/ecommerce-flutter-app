import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressModel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController{

  AddressData addressData = AddressData(Get.find());
 MyServices myServices = Get.find();
 List<AddressModel> dataAddress = []; //data اللي بعبي فيها ال 




  StatusRequest statusRequest  = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressid;



  choosePaymentMethod(String val)
  {
    paymentMethod = val;
    update();
  }


  chooseDeliveryType(String val)
  {
     deliveryType = val;
    update();
  }


  chooseShippingAddress(String val)
  {
     addressid = val;
    update();
  }


  getShippingAddress() async{
         statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await addressData.getData(myServices.sharedPreferences.getString("id")!); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         // data.addAll(response['data']);

         List listdata = response['data']; // get the data 
         dataAddress.addAll(listdata.map((e) => AddressModel.fromJson(e))); //data اللي بعبي فيها ال 
         if(dataAddress.isEmpty){
      statusRequest = StatusRequest.failure;
      }
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh
  }
  @override
  void onInit() {
    getShippingAddress();
    super.onInit();
  }

}