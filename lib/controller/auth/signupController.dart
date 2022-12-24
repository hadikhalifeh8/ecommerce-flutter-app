import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phoneno;
  late TextEditingController password;


  SignupData signupData = SignupData(Get.find());

  List data = [];

    StatusRequest statusRequest = StatusRequest.none;

  // @override
  // signUp() {
  //     var formdata = formstate.currentState;
  //   if(formdata!.validate())
  //   {
  //     print("Validate");
  //    Get.offNamed(AppRoute.verifycodesignup);
  //    // Get.delete<SignUpControllerImp>(); Or lazyput in view (dispose automatically معش في)
  //   }else{
  //     print("Not Validate");
  //   }
    
   
  // }

   @override
  signUp() async{
      
    if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await signupData.postdata(name.text, email.text, phoneno.text, password.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        // data.addAll(response['data']); // add بحط بس  register(api)بألب ال token عشان حاطط 
        data.add(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     } 
      update();

      Get.offNamed(AppRoute.verifycodesignup,  arguments:{"email": email.text} ); //verifycode لصفحة ال  email ببعت ال 
    }else{
      Get.defaultDialog(title: "Warning ", middleText: "ph / ema @ alrady exists");
       statusRequest = StatusRequest.failure;
    }
  } 
  
  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }


  @override
  void onInit() {
    name      = TextEditingController();
    email         = TextEditingController();
    phoneno    = TextEditingController();
    password      = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phoneno.dispose();
    password.dispose();
    super.dispose();
  }

}