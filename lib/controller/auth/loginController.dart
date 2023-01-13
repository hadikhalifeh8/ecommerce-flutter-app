import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{

 LoginData loginData = LoginData(Get.find()); 

 MyServices myServices = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

 late TextEditingController email;
 late TextEditingController password;

 bool isShowPassword = true;
 StatusRequest statusRequest = StatusRequest.none;

 showPassword()
 {
   isShowPassword = isShowPassword ==true ? false : true ;
   update();
 }

  // @override
  // login() {
  //   var formdata = formstate.currentState;
  //   if(formdata!.validate())
  //   {
  //     print("Validate");
  //   }else{
  //     print("Not Validate");
  //   }
   
  // }


    @override
  login() async{

   if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await loginData.postdata( email.text,  password.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        // data.addAll(response['data']);
// if not approve the account 
       
       if(response['data']['user_approve'] == "1")
       {
           myServices.sharedPreferences.setString("id", response['data']['id'].toString());
       myServices.sharedPreferences.setString("name", response['data']['name'].toString());
       myServices.sharedPreferences.setString("email", response['data']['email'].toString());
       myServices.sharedPreferences.setString("phone", response['data']['phone_no'].toString());

       myServices.sharedPreferences.setString("step", "2");

       Get.offNamed(AppRoute.homepage);
       }
       else{
             Get.toNamed(AppRoute.verifycodesignup, arguments: { "email": email.text});
       }
     
      }
      else{
        Get.defaultDialog(title: "Warning ", middleText: "Email or Password  not correct");
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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

    @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }


  @override
  void onInit() {
    // send notification via firebase
 
  //  FirebaseMessaging.instance.getToken().then((value)  {
  //     print(value);
  //     String? token = value;
  //  });

    email    = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  


}