import 'package:ecommerce/controller/auth/ForgetPassword/forgetpasswordController.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "forget_password".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=> 
      
      //  controller.statusRequest == StatusRequest.loading ? 
      //      const Center(child: Text("loading ..,")) 
      //       :

      // HandlingDataRequest : loading / offline / serverfailure/ ...
HandlingDataRequest(statusRequest: controller.statusRequest,
           widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              ///// Start welcome
              CustomTextTitleAuth(
                text: "check_email".tr,
              ),
              //// End Welcome
              const SizedBox(
                height: 10.0,
              ),

              /// Start Sign in Text Body
              CustomSignInTextBodyAuth(textBody: "forget_pasword_txt".tr),

              /// End Sig in Text Body

              const SizedBox(height: 25.0),

             
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
              ),
              //////// End 2nd textFormfeild


              // Start Forget Password  And Button Sign in
             
              CustomButtonAuth(
                text: "check".tr,
                onPressed: () {
                  controller.checkemail();
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
