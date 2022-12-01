import 'package:ecommerce/controller/auth/ForgetPassword/forgetpasswordController.dart';
import 'package:ecommerce/controller/auth/ForgetPassword/resetPasswordController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customsignintextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "reset_password".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) =>

    //         controller.statusRequest == StatusRequest.loading 
    //  ? 
    //        const Center(child: Text("loading ..,")) 
    //  :
         // HandlingDataRequest : loading / offline / serverfailure/ ...
     HandlingDataRequest(statusRequest: controller.statusRequest,
           widget:Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              ///// Start welcome
              CustomTextTitleAuth(
                text: "new_password".tr,
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              CustomSignInTextBodyAuth(textBody: "new_password_txt".tr),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),


              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                  valid:  (val){
                 return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "password_hint".tr,
                labeltext: "password_label_text".tr,
                iconData: Icons.lock_outlined,
                isNumber: false,
                 obscreText: controller.isShowPassword,
                onTapIcon:()
                {
                  controller.showPassword();
                },
              ),
              //////// End 2nd textFormfeild
              ///
             
              //////// Start 2nd textFormfeild
              CustomTextFormAuth(
                  valid:  (val){
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.repassword,
                hinttext: "re_enter_password_hint".tr,
                labeltext: "re_enter_password_label_text".tr,
                iconData: Icons.lock_outlined,
                isNumber: false,
                obscreText: controller.isShowPassword,
                onTapIcon:()
                {
                  controller.showPassword();
                },
              ),
              //////// End 2nd textFormfeild


              // Start Forget Password  And Button Sign in
             
              CustomButtonAuth(
                text: "save".tr,
                onPressed: () {
                 //  controller.resetPassword();
                  controller.goTosuccessResetPassword();
                },
              ),
              // End Forget Password And Button Sign in
              
             
            ],
          ),
        ),
      ),
     )
      )
      

    );
  }
}
