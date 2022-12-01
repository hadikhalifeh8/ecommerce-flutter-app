import 'package:ecommerce/controller/auth/ForgetPassword/verifyCodeController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/auth/customsignintextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
      body: Container(
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
            controller.goToResetPassword(verificationCode);
        }, // end onSubmit
    ),
  //////// End  Verify Code

            
           
          ],
        ),
      ),
    );
  }
}
