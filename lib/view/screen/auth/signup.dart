import 'package:ecommerce/controller/auth/signupController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customsignintextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtextsignupORsignin.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Get.lazyPut( () => SignUpControllerImp());// (OR بستعمل Binding)
  //  SignUpControllerImp controller = Get.put(SignUpControllerImp()); /getbuilder تحت بال  controller  عرفنا ال 
     Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "Sign_up".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
      body: WillPopScope(
        onWillPop: alertexitapp,
        
        child: GetBuilder<SignUpControllerImp>
      (builder: (controller) => 
    
      //*******Loading ****** */
      // controller.statusRequest == StatusRequest.loading ?
      // const Center(child: Text("loading ..,"))  :
      //*******Loading ****** */

     // HandlingDataRequest : loading / offline / serverfailure ...
       HandlingDataRequest(statusRequest: controller.statusRequest,
           widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              ///// Start welcome
              CustomTextTitleAuth(
                text: "welcome_Back".tr,
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              CustomSignInTextBodyAuth(textBody: "Sign_up_text".tr),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),

              //////// Start 1st textFormfeild
              CustomTextFormAuth(
                valid:  (val){
                return validInput(val!, 5, 20, "username");
                },
                mycontroller: controller.name,
                hinttext: "username_hint".tr,
                labeltext: "username_label_text".tr,
                iconData: Icons.person_outline,
                isNumber: false,
 
                //  mycontroller: ,
              ),
              //////// End 1st textFormfeild

              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                  valid:  (val){
                    return validInput(val!, 5, 100, "email");
                  
                },
                mycontroller: controller.email,
                hinttext: "email_hint".tr,
                labeltext: "email_label_text".tr,
                iconData: Icons.email_outlined,
                isNumber: false,

                //  mycontroller: ,
              ),
              //////// End 2nd textFormfeild

              //////// Start 3rd textFormfeild
              CustomTextFormAuth(
                  valid:  (val){
                    return validInput(val!, 9, 20, "phone");
                  
                },
                mycontroller: controller.phoneno,
                hinttext: "phone_number_hint".tr,
                labeltext: "phone_number_label_text".tr,
                iconData: Icons.phone_android_outlined,
                isNumber: true,

                //  mycontroller: ,
              ),
              //////// End 3rd textFormfeild

              //////// Start 4th textFormfeild
              CustomTextFormAuth(
                  valid:  (val){
                    return validInput(val!, 9, 50, "password");
                  
                },
                mycontroller: controller.password,
                hinttext: "password_hint".tr,
                labeltext: "password_label_text".tr,
                iconData: Icons.lock_outlined,
                isNumber: false,

                //  mycontroller: ,
              ),
              //////// End 4th textFormfeild

              // Start  Button Sign in
             
              CustomButtonAuth(
                text: "Sign_up".tr,
                onPressed: () {
                  controller.signUp();
                },
              ),
              // End  Button Sign in
              const SizedBox(
                height: 15.0,
              ),
              // start Don't have an account


              CustomTextSignUpORSignIn(
                textone: "have_an_account".tr,
                texttwo: "Sign_In".tr,
                onTap: () {
                  controller.goToLogin();
                },
              ),
            
              // End Don't have an account
            ],
          ),
        ),
      )),), )
    );
  }
}
