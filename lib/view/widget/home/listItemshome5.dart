import 'package:ecommerce/controller/pages/home/homecontroller.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ListItemsHome extends StatelessWidget {
  class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Container(height: 140.0,
     child: ListView.builder(
      itemCount: controller.items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Items(itemsModel: ItemsModel.fromJson(controller.items[index]));

    //     return Stack(children: [
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    //         margin: EdgeInsets.symmetric(horizontal: 10.0),

    //         child: Image.network("${AppLink.imageItems}/${controller.items[index]['image']}", 
    //         height: 100.0,width: 150.0,fit: BoxFit.fill,),
    //         ),

    // ///shadow متل 
    //         Container(
    //           decoration: BoxDecoration(
    //             color: Colors.black.withOpacity(0.3),
    //             borderRadius: BorderRadius.circular(15.0)
    //           ),
              
    //           height: 120.0,
    //           width: 180.0,
    //           ),

    //           Positioned(left: 10.0,
    //             child: 
    //           Text("${controller.items[index]['name_en']}",style: const TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),))

    //     ],);
      }
     ),
     
     );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  
  const Items({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),

            child: Image.network("${AppLink.imageItems}/${itemsModel.image}", 
            height: 100.0,width: 150.0,fit: BoxFit.fill,),
            ),

    ///shadow متل 
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15.0)
              ),
              
              height: 120.0,
              width: 180.0,
              ),

              Positioned(left: 10.0,
                child: 
              Text("${itemsModel.nameEn}",style: const TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),))

        ],);
  }
}