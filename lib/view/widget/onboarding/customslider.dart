import 'package:ecommerce/controller/onBoarding_Controller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
              itemCount: onBoardingList.length,
              itemBuilder: ((context, i) => Column(
                    children: [
                      
                     // const SizedBox(height: 80.0),
                   Lottie.asset(onBoardingList[i].image!, height: Get.width / 1.3, ),
                   
                    /*  Image.asset(
                        onBoardingList[i].image!,
                    //    width: 200.0,
                        height: Get.width / 1.3,                     //   fit: BoxFit.fill,
                      ),*/
                       const SizedBox(height: 50.0),
                      Text(
                        onBoardingList[i].title!,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0,
                             color: AppColor.black),
                      ),
                      const SizedBox(height: 10.0,),
                     
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          onBoardingList[i].body!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              height: 2,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  )));
  }
}