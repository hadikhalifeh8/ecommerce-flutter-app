import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/onBoarding_Controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/dotscontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(OnBoardingControllerImp()) ;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
            child: Column(
      children: [
        const Expanded(
       /////////////////// Start Slider  ///////////////////////////   
          flex: 4,
          child: CustomSliderOnBoarding(),
        ),
         /////////////////// End Slider  /////////////////////////// 


        Expanded(
            flex: 1,
            child: Column(
              ///////////////// Start the 4th dash's dots   - - - - ////////////////////////////////
              children: const [
              CustomDotControllerOnBoarding(),
                ///////////////// End the 4th dash's  - - - - ////////////////////////////////

                ///////////////// Start the material button  - - - - ////////////////////////////////
                Spacer(flex: 2),
                CustomButtonOnBoarding()

                ///////////////// End the material button  - - - - ////////////////////////////////
              ],
            ))
      ],
    )));
  }
}
