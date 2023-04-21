import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController 
{

MyServices myServices = Get.find();

  logout()
  {
    
        String userid = myServices.sharedPreferences.getString("id").toString();

    FirebaseMessaging.instance.unsubscribeFromTopic("users"); // لكل المستخدمين
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}"); // خاص Topic إلو  user  كل // firebase topic for specific user
print("{Logoout User id is : $userid}");

   myServices.sharedPreferences.clear(); // null 
   Get.offAllNamed(AppRoute.login);
  }
}