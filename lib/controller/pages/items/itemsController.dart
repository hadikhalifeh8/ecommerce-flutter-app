import 'package:get/get.dart';
abstract class ItemsController extends GetxController{
initialData();
changeSelectedCategory(int val); //جديد item بس بدي  إختار
}
class ItemsControllerImp extends ItemsController {

 List categories = [];
 int? selectedCategory; //وبعلم على النوع اللي اخترتو items بيفتح صفحه ال  category  بس إكبس على أيا 

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories']; // homeController من صفحه ال 
    selectedCategory = Get.arguments['selectedCategory']; // homeController من صفحه ال
    
  }
  
  @override
  changeSelectedCategory(val) {
    selectedCategory = val;
    update();
  }
 
}