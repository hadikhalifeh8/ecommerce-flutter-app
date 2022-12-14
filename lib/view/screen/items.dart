import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/items/itemsController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/customappbar1.dart';
import 'package:ecommerce/view/widget/items/listCategoriesItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Item_s extends StatelessWidget {
  const Item_s({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        
        child: ListView(children: [
              
                  CustomAppBar(titleappbar: "Find Product", onPressedIcon: (){}, onPressedSearch: (){},),
                 const SizedBox(height: 15.0,),
                 const ListCategoriesItems(),

                GridView.builder(
                  //listview بقلب  gridview عشان 
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //listview بقلب  gridview عشان

                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7), 
                  
                  itemBuilder: (BuildContext context, index) {
                     return InkWell(
                      child: Card(  // أقسام
                        
                   //   color: AppColor.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column( 
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                  
                        children: [
                        CachedNetworkImage(imageUrl: AppLink.imageItems + "/laptop1.jpg",),
                        Text("Laptop Services", style: TextStyle(color: AppColor.black, fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text("Description of each Laptop Gos Here  yes Here", textAlign: TextAlign.center,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("200\$", style: TextStyle(color: AppColor.primaryColor, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "sans")),
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: AppColor.primaryColor))
                      ],)
                      ],
                      
                      ),
                    ),

                      ),

                  
                      );

                  }),
        ]),
      ),
    );
  }
}