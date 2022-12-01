import 'package:ecommerce/controller/onBoarding_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 40.0,
                  child:  MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 0.0),
                    textColor: Colors.white,
                      onPressed: ()
                       {
                        controller.next();
                       },
                  color: AppColor.primaryColor,
                  child: const Text("Continue"))
                );
  }
}