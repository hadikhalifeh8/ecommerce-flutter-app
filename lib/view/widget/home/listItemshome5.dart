import 'package:ecommerce/controller/pages/home/homecontroller.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
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
      itemCount: controller.countitems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Items(cartsModel: CartModel.fromJson(controller.countitems[index]));
      }
     ),
     
     );
  }
}

class Items extends StatelessWidget {
  // final ItemsModel itemsModel;
   final CartModel cartsModel;


  
  const Items({Key? key, required this.cartsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),

            child: Image.network("${AppLink.imageItems}/${cartsModel.itemRltn!.image.toString()}", 
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
              Text("${cartsModel.itemRltn!.nameEn}",style: const TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),))

        ],);
  }
}