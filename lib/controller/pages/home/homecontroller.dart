import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
initialData();
getdata();
goToItems(List categories, int selectedCategory, String category_id); // latop / mobile ...  // by favorites

String? lang;
}

class HomeControllerImp extends HomeController{

List<ItemsModel> listdata = [];

MyServices myServices = Get.find();

// String? username;
String? categoryid;



  
  HomeData homeData = HomeData(Get.find());
 // List data = [];
  List categories = [];
  List items = [];
  // List favorites =[];

  
  late StatusRequest statusRequest;

late  TextEditingController search;
bool isSearch = false;

 //automatically  من دون ما أضغط  search بس يمحي اللي كاتبه بال 
checkSearch(val)
{ 
  if(val == "")
     { 
      isSearch = false;
     }
     update();
}
//search بس يضغط على زر ال 
onSearchItems() 
{ 
  isSearch = true;
  searchData();
  update();
}



@override
  initialData(){
// username = myServices.sharedPreferences.getString("name"); // name: men login page static msh men l database
// categoryid = Get.arguments['email'];
lang = myServices.sharedPreferences.getString("lang");

}


@override
  void onInit() {
    // FirebaseMessaging.instance.subscribeToTopic('users');  // b7ota bl login
    
    getdata();
    search = TextEditingController();
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
 
   
  searchData() async {
           statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await homeData.searchData(search.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        listdata.clear();
       
        List responsedata = response['data'];
       listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
    print("+++++++++++++++*****************************************++++++++++++++");
    print("+++++++++++++++${listdata}++++++++++++++");

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



//alt+shift+f