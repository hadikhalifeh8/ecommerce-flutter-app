import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
initialData();
getdata();
goToItems(List categories, int selectedCategory, String category_id); // latop / mobile ... 
}

class HomeControllerImp extends HomeController{

MyServices myServices = Get.find();

// String? username;
String? categoryid;

  
  HomeData homeData = HomeData(Get.find());
 // List data = [];
  List categories = [];
  List items = [];

  
  late StatusRequest statusRequest;


@override
  initialData(){
// username = myServices.sharedPreferences.getString("name"); // name: men login page static msh men l database
// categoryid = Get.arguments['email'];
}


@override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }
  
  @override
  getdata() async{

     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await homeData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         categories.addAll(response['categories']);
         items.addAll(response['items']);

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
 
  }
  
  // categories container 
  @override
  goToItems(categories, selectedCategory, category_id) 
   { 
     Get.toNamed(AppRoute.items, arguments: {
       "categories" : categories,
       "selectedCategory" : selectedCategory,
       "catid" : category_id, // itemsController ببعتو لل  catid 
      
   });
  
  }
  // categories container 

}