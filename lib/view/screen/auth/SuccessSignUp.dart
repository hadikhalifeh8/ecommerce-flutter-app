import 'package:ecommerce/controller/auth/successsignupController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
  SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());

    return Scaffold(
            appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0, // لحتى يشيل الخط ويكون بنفس مستوى الصفخه
          centerTitle: true,
          title: Text(
            "success".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          )),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
        const   Center(child: Icon(Icons.check_circle_outline, size: 200, color: AppColor.primaryColor,),
          ),
        const Text("........................................"),
        const Text("........................................"),
        const Spacer(),
        Container(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "go_To_login".tr,
                onPressed: () {
                  controller.goToLoginPage();
                },
              ),
          ),

          
           const  SizedBox(height:50.0)
          
        

        ],),
      ),
    );
  }
}