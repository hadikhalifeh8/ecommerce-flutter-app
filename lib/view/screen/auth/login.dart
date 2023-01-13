import 'package:ecommerce/controller/auth/loginController.dart';
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
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "Sign_in".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
      body: WillPopScope(
         onWillPop: alertexitapp,
         
        child:  GetBuilder<LoginControllerImp>(builder: (controller)=>
          // controller.statusRequest == StatusRequest.loading ? 
          //  const Center(child: Text("loading ..,")) 
          //   :
          HandlingDataRequest(statusRequest: controller.statusRequest,
           widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              // start logo
              const LogoAuth(),
              // End logo
              ///// Start welcome
              CustomTextTitleAuth(
                text: "welcome_Back".tr,
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              CustomSignInTextBodyAuth(textBody: "Sign_in_text".tr),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),
              //////// Start 1st textFormfeild
              CustomTextFormAuth(
                
                  valid:  (val){
                    return validInput(val!, 5, 100, "email");
                },
                hinttext: "email_hint".tr,
                labeltext: "email_label_text".tr,
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
                isNumber: false,
                //  mycontroller: ,
              ),
              //////// End 1st textFormfeild

              //////// Start 2nd textFormfeild
             GetBuilder<LoginControllerImp>(
              builder: (controller) =>  CustomTextFormAuth(
                  valid:  (val){
                  return validInput(val!, 5, 30, "password");
                },
                hinttext: "password_hint".tr,
                labeltext: "password_label_text".tr,
                iconData: Icons.lock_outlined,
                mycontroller: controller.password,
                isNumber: false,
                obscreText: controller.isShowPassword,
                onTapIcon:()
                {
                  controller.showPassword();
                }, 
                //  mycontroller: ,
              ),),
              //////// End 2nd textFormfeild

              // Start Forget Password  And Button Sign in
              InkWell(
                onTap: (){
                  controller.goToForgetPassword();
                },
                child: Text(
                  "forget_password".tr,
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtonAuth(
                text: "Sign_in".tr,
                onPressed: () { 
                          controller.login();
                  },
              ),
              // End Forget Password And Button Sign in
              const SizedBox(
                height: 15.0,
              ),
              // start Don't have an account
              CustomTextSignUpORSignIn(
                textone: "dont_have_an_account".tr,
                texttwo: "Sign_up".tr,
                onTap: () {
                  controller.goToSignUp();
                },
              ),
              // End Don't have an account
            ],
          ),
        ),
    ) )),)
    );
  }
}
