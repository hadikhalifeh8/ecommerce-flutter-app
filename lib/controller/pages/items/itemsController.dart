import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handlingDataController.dart';
import 'package:ecommerce/data/datasource/remote/item_data.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
initialData();
changeSelectedCategory(int val, String catval); //جديد item بس بدي  إختار

getallitems(String category_id); // get items by category

goToProductDetailsPage(ItemsModel itemsModel);

}
class ItemsControllerImp extends ItemsController {

ItemsData itemsData = ItemsData(Get.find());

 List categories = [];
 int? selectedCategory; //وبعلم على النوع اللي اخترتو items بيفتح صفحه ال  category  بس إكبس على أيا 
String? catid; //  from homecontroller



 List data = [];
 late StatusRequest statusRequest ;



  @override
  void onInit() {
    initialData();
    super.onInit();
  }


  @override
  initialData() {
    categories = Get.arguments['categories']; // homeController من صفحه ال 
    selectedCategory = Get.arguments['selectedCategory']; // homeController من صفحه ال
   
    catid = Get.arguments['catid']; //  homeController من صفحه ال 
    getallitems(catid!);
  }
  
  @override
  changeSelectedCategory(val, catval) {
    selectedCategory = val;
    catid = catval ;
    getallitems(catid!);
    update();
  }
  
  @override
  getallitems(category_id) async{
    data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      var response = await itemsData.getData(category_id); //loading هون خلص 

     print("***************##############************* Controler $response ");
     print(category_id);
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         data.addAll(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
      update(); // Refresh 
  }
  
  @override
  goToProductDetailsPage(ItemsModel itemsModel) {
  Get.toNamed('productDetails', arguments: {
      'itemsModel' : itemsModel,
  });
  }
}
