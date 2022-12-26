import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/pages/home/productDetailscontroller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/functions/translateDatabase.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/productsDetails/price_add_minus.dart';
import 'package:ecommerce/view/widget/productsDetails/subitemsList_Colors.dart';
import 'package:ecommerce/view/widget/productsDetails/toppageProductDetailsImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  ProductDetalsControllerImp controller = Get.put(ProductDetalsControllerImp());
    return Scaffold(
      

///////////////////////// Start bottomNavigationBar /////////////////////////////// 
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50.0,
        margin: const EdgeInsets.all(10.0),
         padding: const EdgeInsets.only(bottom: 5.0),
       
        decoration: BoxDecoration(
                         color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0)),

     child:  const Text("Add To Card", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold), )
      ),
///////////////////////// End bottomNavigationBar /////////////////////////////// 



      body: Container(
        
        
        child: ListView(children: [
         
   /////////////////////////Start 1st Box ///////////////////////////////
      const  TopPageProductDetailsImage(),
   /////////////////////////End 1st Box ///////////////////////////////
   

   /////////////////////////End 2nd Box ///////////////////////////////
   const SizedBox(height: 30,),
   Container(
    padding: const EdgeInsets.all(20.0),
    //margin: EdgeInsets.symmetric(vertical: 50),
   // height: 200,
    // color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
          Text(translateDateBase("${controller.itemsModel.nameAr}", "${controller.itemsModel.nameEn}"),
           style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.fourthColor),
           ),

     ////////////////// start price + / - //////////////////     
  const SizedBox(height: 10.0),
       
       PriceAddMinus(onAdd: (){}, onMinus: (){}, price: "5000.0", count: "1"),
              
          
    ///////////////// End price + / - //////////////////  
           
  const SizedBox(height: 10.0),
            Text(translateDateBase("${controller.itemsModel.descriptionAr}", "${controller.itemsModel.descriptionEn}"),
           ),

 /////////////////////Start  colors //////////////////////////
  const SizedBox(height: 10.0),

          Text("Color", style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.fourthColor),),
          
        const  SizedBox(height: 5.0,),

      const  SubItemsListColors(),
      
            
        //     Container(
              
        //       alignment: Alignment.center,
        //       padding: const EdgeInsets.only(bottom: 5.0),
        //       height: 60.0 , width: 90.0,
        //       decoration: BoxDecoration(border: Border.all(color: AppColor.fourthColor),
        //        borderRadius: BorderRadius.circular(10),
               
        //        color: AppColor.fourthColor),
        
        // child: Text("Red", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        //        ),


        //     Container(
        //       margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        //       alignment: Alignment.center,
        //       padding: const EdgeInsets.only(bottom: 5.0),
        //       height: 60.0 , width: 90.0,
        //       decoration: BoxDecoration(border: Border.all(color: AppColor.fourthColor),
        //        borderRadius: BorderRadius.circular(10),
        //        //color: AppColor.fourthColor
        //        ),
        
        // child: Text("Black", style: TextStyle(color: AppColor.fourthColor, fontWeight: FontWeight.bold),),
        //        ),

              
        //     Container(
            
        //       alignment: Alignment.center,
        //       padding: const EdgeInsets.only(bottom: 5.0),
        //       height: 60.0 , width: 90.0,
        //       decoration: BoxDecoration(border: Border.all(color: AppColor.fourthColor),
        //        borderRadius: BorderRadius.circular(10),
        //      //  color: AppColor.fourthColor
        //        ),
        
        // child: Text("Blue", style: TextStyle(color:AppColor.fourthColor, fontWeight: FontWeight.bold),),
        //        ),
    

          //  ],
          //  ),
   ////////////////////End Color /////////////////////        

         ],),
         ),
   /////////////////////////End 2nd Box ///////////////////////////////


          
        ],),
      ),

    );
  }
}