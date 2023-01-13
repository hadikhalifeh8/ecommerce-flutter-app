import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodeSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp(String verifycodesignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{

  VerifyCodeSignUpData verifycodesignUpdata = VerifyCodeSignUpData(Get.find());


 String? email; // البريد الإلكتروني اللي كتبتو (1)
  
StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {
   
  }
  
  @override
  goToSuccessSignUp(verifycodesignup) async{
              statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
                update();

     var response = await verifycodesignUpdata.postdata(email!, verifycodesignup); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.successSignUp);
      }
      else{
       Get.defaultDialog(title: "Warning ", middleText: "Verify Code Not Correct");
         statusRequest = StatusRequest.failure; 
      }
     } 
      update();

    }
/** resend verify code */

    reSend(String email){
             verifycodesignUpdata.resendVerifyCodeData(email);
    }

/** resend verify code */

    
  @override
  void onInit() {
    email = Get.arguments['email']; //Signup من صفحة ال 
    
    super.onInit();
  }
}