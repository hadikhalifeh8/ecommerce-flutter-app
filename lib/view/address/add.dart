import 'package:ecommerce/controller/pages/address/addController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
                appBar: 
                AppBar(title: const Text("add new address"),
                        // centerTitle: true
                ),

          


                body: Container(child: 
               GetBuilder<AddAddressController>(builder: (controllerpage) => 
               HandlingDataView(statusRequest: controllerpage.statusRequest, 
               widget:    Column(
                     children: [

                      if(controllerpage.kGooglePlex !=null)
                       Expanded(
                         child: Stack(
                          // alignment: AlignmentDirectional.bottomCenter,
                          alignment: AlignmentDirectional.center,


                           children: [
                             GoogleMap(
                                   mapType: MapType.normal,

                                   markers: controllerpage.markers.toSet(),
                                   onTap: (LatLng){  // العلامه الحمراء
                                         controllerpage.addMarker(LatLng);
                                   },

                                   initialCameraPosition:  controllerpage.kGooglePlex!,
                                   onMapCreated: (GoogleMapController controllermap) {
                                     controllerpage.completercontroller?.complete(controllermap);
                                   },
                                 ),
                               Positioned(
                                bottom: 20.0,
                                 child: Container(
                                                child:MaterialButton(
                                                   minWidth: 250,
                                                         onPressed: (){
                                                            controllerpage.goToAddaddressPage2();
                                                         }, 
                                                        child: Text("continue",style: TextStyle(fontSize: 20),),
                                                        color: AppColor.primaryColor,
                                                        textColor: Colors.white,
                                                
                                                ),
                                                ),),
                               
                           ],
                         ),
                       ),
                     ],
                   )),)
                ),
    );
  }
}