import 'package:ecommerce/controller/onBoarding_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnBoardingControllerImp>(
      builder: (controller)=>Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        onBoardingList.length,
                        (index) => AnimatedContainer(
                              margin: const EdgeInsets.all(5.0),
                              duration: const Duration(milliseconds: 900),
                              width: controller.currentPage == index ? 20 : 5,
                              height: 6,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )),
                  ],
                ));
  }
}