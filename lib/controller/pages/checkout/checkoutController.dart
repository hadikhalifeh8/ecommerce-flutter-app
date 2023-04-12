import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckOutController extends GetxController{
  late String couponid;
  late String priceOrder;

  String? coupondiscount;





  AddressData addressData = AddressData(Get.find());
 MyServices myServices = Get.find();
 List<AddressModel> dataAddress = []; //data اللي بعبي فيها ال 


  CheckOutData checkOutData = CheckOutData(Get.find());




  StatusRequest statusRequest  = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType ;
  String? addressid =""; // if choose DriveThru / Personal Car the address is null



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

// get the address from view address to checkout page
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
        
      //    if(dataAddress.isEmpty){
      // statusRequest = StatusRequest.failure;
      // }
      }
      else{
        statusRequest = StatusRequest.none; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh
  }



    checkout() async{

   if(paymentMethod == null) return Get.snackbar("warning", "select a payment method");

   if(deliveryType == null) return Get.snackbar("warning", "select an order delivery type");

// if deliveryType = delivery and not have address or (no address selected)
  // if(deliveryType == "0" &&  dataAddress.isEmpty  )
   if(deliveryType == "0" &&  addressid ==""  )

        return Get.snackbar("warning", "please select your address to shipping order");



         statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)

         update();


 
         Map datas = {
                      "user_id" : myServices.sharedPreferences.getString("id"),
                      "address_id": addressid.toString(),
                      "used_coupon" :couponid.toString(),


                      "order_type":deliveryType.toString(),
                      "payment_method" :paymentMethod.toString(),
                      "order_price_delivery" : "10",
                      "order_price" :priceOrder,
                      "coupon_discount": coupondiscount.toString(),
                      //"total_price":"100", //backend (order) عملتها بال 
                      "status" :"0",
                     

                      
                    };

     var response = await checkOutData.checkout(
      datas
                      //  myServices.sharedPreferences.getString("id")!,
                      //  addressid.toString(),
                      //  deliveryType.toString(),
                      //  orderType,
                       
                      //  deliveryPriceOrder,
                      //  priceOrder,
                      //  couponid,

         ); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("success", "order sent successfully");
       print("yesssssssss");
       print(datas);
      }


      // else{   // for status : success / failure
      //   statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
       
         
      // }
     }else{
       statusRequest = StatusRequest.none;
       Get.snackbar("error", "try again");
      print("failsssss");
      print(datas);
     }
     
      update(); // Refresh
  }



 

  @override
  void onInit() {
    // أول ما تفتح الصفحه
   couponid = Get.arguments['couponId_']; //cartController اللي عم يوصلوني من صفحة ال 
   priceOrder = Get.arguments['priceorder_']; //  cartController اللي عم يوصلوني من صفحة ال 
   //coupondiscount = Get.arguments['discountCoupon_']; //  cartController اللي عم يوصلوني من صفحة ال 
   coupondiscount = Get.arguments['discountCoupon_'].toString();


    getShippingAddress();
    super.onInit();
  }

}