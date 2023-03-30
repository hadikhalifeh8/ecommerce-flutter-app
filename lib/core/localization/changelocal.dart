import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

//    بيفتح الأبليكيشن حسب لغةالهاتف تلقائيا 
class LocalController extends GetxController {

  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish; //ar / en حسب نوع اللغه  font  غير ال 

// بس أضغط على زر اللغه العربيه بياخد اللغه العربيه لللأبليكيشن والعكس صحيح 
  
    changeLanguage(String languageCode) {
    
          Locale locale = Locale(languageCode);
          myServices.sharedPreferences.setString("lang", languageCode);
          appTheme = languageCode =="ar" ? themeArabic : themeEnglish ;
       Get.changeTheme(appTheme);
       Get.updateLocale(locale);
  }


  requestPermissionLocation()async{
    bool serviceEnabled;
  LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled(); //مفعل بالموبايل location لو ال
  
     if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Get.snackbar("alert", "please turn on the location service");
  }

  permission = await Geolocator.checkPermission();//location بتأكد إذا هوي فاتح 
  if (permission == LocationPermission.denied) { //accept permission مش مسموح يفوت عالتطبيق إذا مش عامل 
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Get.snackbar("alert", "please give the app permission yto access your location");
    }
  }

   if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Get.snackbar("alert", "Location permissions are permanently denied, we cannot request permissions. permission needed");
  } 
}


  // أول ما أفتح الأبليكيشن لازم يفتح بلغه الموبايل 
  @override
  void onInit() {

    //application بيطلبن أوا ما يفتح ال  Permisions كل ال 
    requestPermissionLocation();
   
   
    // اذا كاين فاتح التطبيق قبل وعاد فتحو بيرجعلو اللغه اللي كان فايت فيها 
    String? sharedPrefLanguage = myServices.sharedPreferences.getString("lang");
   
    if(sharedPrefLanguage == "ar")
    {
      language = const Locale("ar");
      appTheme = themeArabic ; 
    } else if 
      (sharedPrefLanguage == "en")
    {
      language = const Locale("en");
      appTheme = themeEnglish ;
    }
   // اذا كانت أول مره بيفتح التطبيق بياخد لغة الجهاز 
    else{
          language = Locale(Get.deviceLocale!.languageCode);
          appTheme = themeEnglish ; // قيمه الإفتراضيه
    }  
    
    super.onInit();
  }
}