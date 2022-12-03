
import 'package:ecommerce/binding.dart';
import 'package:ecommerce/bindings/initialBinding.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/test.dart';


import 'package:ecommerce/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  LocalController controller =  Get.put(LocalController());

    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
     // home: const Language(),route   بعملها بال  middleware عشان إستخدم ال 
      //const Test(),
     //  initialBinding: MyBinding(),
       initialBinding: InitialBindings(),
    //  routes: routes,
    getPages: routes,


    );
  }
}
