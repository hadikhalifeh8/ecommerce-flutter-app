import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/resetPassword/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController{
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());

String? email; // البريد الإلكتروني اللي كتبتو (1)
// late String verifyCode;
StatusRequest? statusRequest;
  


  @override
  checkCode() {
   
  }
  
  @override
  goToResetPassword(verifycode) async{
                  statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
                update();

     var response = await verifyCodeForgetPasswordData.postdata(email!, verifycode); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.resetPassword, arguments:{
                     "email": email
        });
      }
      else{
       Get.defaultDialog(title: "Warning ", middleText: "Verify Code Not Correct");
         statusRequest = StatusRequest.failure; 
      }
     } 
      update();

    
  }


  @override
  void onInit() {
        email = Get.arguments['email']; //forgetpassword من صفحة ال 

    super.onInit();
  }



}