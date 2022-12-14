import 'package:ecommerce/controller/pages/home/homecontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// class ListCategoriesHome extends StatelessWidget {
  class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

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

      //   return Column(
      //      children: [
      //        Container(  height: 70,
      //                           width: 70,
      //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: AppColor.thirdColor),
      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
             

      // //    child: CachedNetworkImage(imageUrl: "${AppLink.imageCategories}/${controller.categories[index]['image']}"), // image.png/jpg ...
      //         child: SvgPicture.network("${AppLink.imageCategories}/${controller.categories[index]['image']}",color: AppColor.secoundColor,), // image.svg
      // //    child: SvgPicture.asset("${AppLink.imageCategories}/${controller.categories[index]['image']}"),
      //        ),
      //         Text("${controller.categories[index]['name_en']}", style:const TextStyle(fontSize: 13.0, color: Colors.black),),
      //      ],); 
        },
        ),
     );
  }
}


//categories Model لحتى استخدم 

class Categories extends GetView<HomeControllerImp> {

  final CategoriesModel categoriesModel;
  final int? i;

  const Categories( {Key? key, required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!);
      },
      child: Column(
             children: [
               Container(  height: 70,
                                  width: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: AppColor.thirdColor),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
               
    
        
                child: SvgPicture.network("${AppLink.imageCategories}/${categoriesModel.image}",color: AppColor.secoundColor,), // image.svg
        
               ),
                Text("${categoriesModel.nameEn}", style:const TextStyle(fontSize: 13.0, color: Colors.black),),
             ],),
    );
  }
}
