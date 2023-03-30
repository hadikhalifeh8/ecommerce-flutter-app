import 'package:ecommerce/controller/pages/address/addController.dart';
import 'package:ecommerce/controller/pages/address/addPart2-DetialsController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/shared/CustomButton.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddPart2_Details extends StatelessWidget {
  const AddressAddPart2_Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AddAddressPartTwoController controller = Get.put(AddAddressPartTwoController());
    return Scaffold(
                appBar: 
                AppBar(title: const Text("add details address"),
                        // centerTitle: true
                ),

                body: Container(
                  
                  padding: const EdgeInsets.all(15.0),
                 
                  child: GetBuilder<AddAddressPartTwoController>(builder: (controller) =>  

                  HandlingDataView(statusRequest: controller.statusRequest, 
                  widget:                ListView(children: [
              
              const SizedBox(height: 30.0,),
                 
                 CustomTextFormAuth(hinttext: "city", labeltext: "city", iconData: Icons.location_city, mycontroller: controller.city, valid: (val){}, isNumber: false),

                 CustomTextFormAuth(hinttext: "street", labeltext: "street", iconData: Icons.streetview_outlined, mycontroller: controller.street, valid: (val){}, isNumber: false),

                 CustomTextFormAuth(hinttext: "name", labeltext: "name", iconData: Icons.near_me, mycontroller: controller.name, valid: (val){}, isNumber: false),

                 
                
               CustomButton_Shared(
                                 text: "Add",
                                 onPressed: (){
                                  controller.addAddress();
                                 },
                                 )
               ],
                
                   ),)
                  
                  
                  )

                   ),
                
    );
  }
}