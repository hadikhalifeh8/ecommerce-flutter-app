import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:get/get.dart';

abstract class ProductDetalsController extends GetxController{
  
}
  class ProductDetalsControllerImp extends ProductDetalsController{
 late ItemsModel itemsModel;

initialData(){
itemsModel = Get.arguments['itemsModel'];
}

List subitems = [ // colors list
 {"name" : "red", "id" : 1 , "active" : 1},
  
  {"name" : "black", "id" : 2 ,  "active" : 0},

  {"name" : "blue", "id" : 3 ,  "active" : 0}
];



@override
  void onInit() {
    initialData();
    super.onInit();
  }
  
}