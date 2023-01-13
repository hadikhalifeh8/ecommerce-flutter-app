import 'package:ecommerce/controller/auth/verifycodesignupController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/auth/customsignintextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "verification_code".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
    
      body: 
        GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) =>
        
        // controller.statusRequest ==StatusRequest.loading ?
        //   const  Center(child: Text("Loading ..."),) :

        // HandlingDataRequest : loading / offline / serverfailure/ ...
     HandlingDataRequest(statusRequest: controller.statusRequest,
           widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: ListView(
          children: [
            ///// Start welcome
            CustomTextTitleAuth(
              text: "check_code".tr,
            ),
            //// End Welcome
            const SizedBox(
              height: 10.0,
            ),

            /// Start Sign in Text Body
            CustomSignInTextBodyAuth(textBody: "verify_code_txt".tr),

            /// End Sig in Text Body

            const SizedBox(height: 25.0),

           
  //////// Start Verify Code
            OtpTextField(
            fieldWidth: 50.0,
    borderRadius: BorderRadius.circular(20.0),
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            controller.goToSuccessSignUp(verificationCode);
        }, // end onSubmit
    ),
  //////// End  Verify Code
   
SizedBox(height: 20.0,),
            
           InkWell(onTap: () {controller.reSend(controller.email!);}, 
           child: const Center(child: Text("Resend Verify Code", style: TextStyle(color: AppColor.primaryColor, fontSize: 20),)),)
          ],
        ),
      ),))
    );
  }
}
