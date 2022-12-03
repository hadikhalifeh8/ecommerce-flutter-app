import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{


}

class HomeControllerImp extends HomeController{

MyServices myServices = Get.find();

String? username;


initialData(){
username = myServices.sharedPreferences.getString("name"); // name: men login page static msh men l database
}


@override
  void onInit() {
    
    initialData();
    super.onInit();
  }

}