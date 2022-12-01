import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/resetPassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goTosuccessResetPassword();
} 

class ResetPasswordControllerImp extends ResetPasswordController{

ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

StatusRequest statusRequest = StatusRequest.none;

    GlobalKey<FormState> formstate = GlobalKey<FormState>();


  late TextEditingController password;
  late TextEditingController repassword;

  bool isShowPassword = true;

   String? email; // البريد الإلكتروني اللي كتبتو (1)

    showPassword()
 {
   isShowPassword = isShowPassword ==true ? false : true ;
   update();
 }


  @override
  resetPassword() {

    //  var formdata = formstate.currentState;
    // if(formdata!.validate())
    // {
    //   print("Validate");
    //   Get.offNamed(AppRoute.successResetPassword);
    // }else{
    //   print("Not Validate");
    // }
   
  }
  
  @override
  goTosuccessResetPassword() async{
  /*******************password not match************* */
   if(password.text != repassword.text) {
   return Get.defaultDialog(title: "warning", middleText: "password not match");
   }
   /*******************password not match************* */
   
    if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await resetPasswordData.postdata(email!,  password.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.successResetPassword);
      }
      else{
        Get.defaultDialog(title: "Warning ", middleText: "try again");
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     } 
      update();

       
    }else{
      // Get.defaultDialog(title: "Warning ", middleText: "Email or Password  not correct");
      //  statusRequest = StatusRequest.failure;
    }
    
  }


  @override
  void onInit() {
    email = Get.arguments['email']; //forgetpassword / verifyCodeController من صفحة ال 

    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }

}