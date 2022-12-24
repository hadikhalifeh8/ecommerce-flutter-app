import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

translateDateBase(columnAr, columnEn){

  MyServices myServices = Get.find();

  if(myServices.sharedPreferences.getString("lang") == "ar")
  {
           return columnAr;
  }else{ 
          return columnEn;

  }
}