import 'package:ecommerce/controller/pages/items/itemsController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ListCategoriesHome extends StatelessWidget {
  class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     // Container(height: 100, //container بدل  sizedbox  فيني استخدم 
     SizedBox(height: 100,
       child: 
       // ListView.builder(
        ListView.separated( // separated:والتاني container  /  منفصل بين كل صوره والتانيه 
      separatorBuilder: (context, index) => const SizedBox(width: 10.0),

        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
         
         return Categories(
          i: index, 
          categoriesModel: CategoriesModel.fromJson(controller.categories[index]));

        },
        ),
     );
  }
}


//categories Model لحتى استخدم 

class Categories extends GetView<ItemsControllerImp> {

  final CategoriesModel categoriesModel;
  final int? i;

  const Categories( {Key? key, required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: () {
   //     controller.goToItems(controller.categories, i!);
   controller.changeSelectedCategory(i!);
      },
      child: Column(
             children: [
                 
                 GetBuilder<ItemsControllerImp>(builder: (controller)=>    Container(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 5.0),
                  //المطلوب category بحط خط تحت إسم ال  category بس اكبس على أيا
                   decoration: controller.selectedCategory == i ? const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 3, color: AppColor.primaryColor))
                  ): null,
                 
                  child: Text("${categoriesModel.nameEn}", 
                  style:const TextStyle(fontSize: 20.0, color: AppColor.grey2),),
                ),)

             ],),
    );
  }
}
