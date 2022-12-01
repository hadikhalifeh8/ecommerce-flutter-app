import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{
  
  @override
  int? get priority => 1 ;

   MyServices  myservices = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(myservices.sharedPreferences.getString("onBoarding") == "1"){
     return const RouteSettings(name: AppRoute.login);
    }
    //return null;
  }
}