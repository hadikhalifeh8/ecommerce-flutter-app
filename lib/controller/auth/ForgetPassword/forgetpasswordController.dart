import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/resetPassword/checkemail_sendotp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
  //goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

 CheckEmailData checkEmailData = CheckEmailData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;


  @override
  checkemail() async{
            if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await checkEmailData.postdata( email.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.verifyCode, arguments:{"email" : email.text} );
      }
      else{
        Get.defaultDialog(title: "Warning ", middleText: "Email  not found");
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     } 
      update();

       
    }else{
      // Get.defaultDialog(title: "Warning ", middleText: "Email or Password  not correct");
      //  statusRequest = StatusRequest.failure;
    }
    
   
  }
  
  // @override
  // goToVerifyCode() {
  //   Get.offNamed(AppRoute.verifyCode);
  // }


  @override
  void onInit() {
    
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}