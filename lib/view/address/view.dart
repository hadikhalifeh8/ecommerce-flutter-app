import 'package:ecommerce/controller/pages/address/viewController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
                appBar: 
                AppBar(title: const Text("address"),
                        // centerTitle: true
                ),

     floatingActionButton: 
                    FloatingActionButton(onPressed: (){
                      Get.toNamed(AppRoute.addressadd);
                    }, 
                    child: const Icon(Icons.add),),           


                body: GetBuilder<ViewAddressController>(builder: (controller) =>
                   HandlingDataView(statusRequest: controller.statusRequest, 
                                 widget: Container(child: 
                              ListView.builder(
                                itemCount: controller.data.length,
                                
                                itemBuilder: (context, index){

                                  //return Card(child: Text('${controller.data[index].addressName}'),);
                                  return CardAddress(addressModel: controller.data[index],
                                  onDelete: (){
                                               controller.deleteAddress(controller.data[index].id.toString());
                                  },
                                  );

                                }
                                ),
                                )
                                 )
                                 )
    );
  }
}




class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;

  const CardAddress({Key? key, required this.addressModel, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: ListTile(
                    title: Text("${addressModel.addressName}"),
                    subtitle: Text("${addressModel.city}, ${addressModel.street}"),

                 trailing: IconButton(onPressed: onDelete, 
                 
                 icon:Icon(Icons.delete_outline, color: Colors.red)),   
      
      
      )
      
    ),);
  }
}