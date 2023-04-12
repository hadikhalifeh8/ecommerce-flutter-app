import 'package:ecommerce/controller/pages/settings/settingsController.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  SettingsController controller = Get.put(SettingsController());
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        children: [
          Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [

            Container(
              color: AppColor.primaryColor,
              height: Get.width / 2,
            ), 

            Positioned(top: Get.width / 2.5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0)  
              ),
              child:const  CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage(AppImageAsset.avatarImage),
                    
              ),
            )),
          ],
    ),

      const SizedBox(height: 50,),

       Container(
        margin: const EdgeInsets.all(10.0),
         child: Card(
          child: Column(children: [

            ListTile(
               onTap: () {
                
              },
              
              title: const Text("Disable Notification"), 
              //trailing: const Icon(Icons.notifications_active_outlined),
              trailing: Switch(value: true, onChanged: (val){}),
              ),
          //  Divider(),

             ListTile(
               onTap: () {
                Get.toNamed(AppRoute.pendingOrders);
                
              },
              
              title: const Text("Pending Orders"), 
              //trailing: const Icon(Icons.notifications_active_outlined),
              trailing: const Icon(Icons.reply_all_outlined),
              ),
              // Divider(),

                 ListTile(
               onTap: () {
                
              },
              
              title: const Text("Archieve Orders"), 
              //trailing: const Icon(Icons.notifications_active_outlined),
              trailing: const Icon(Icons.archive_outlined),
              ),





          // Divider(),  
            ListTile(
               onTap: () {
                Get.toNamed(AppRoute.addressView);
              },
              
              title: const Text("Address"), 
              trailing: const Icon(Icons.location_on_outlined),
              
              ),
          //  Divider(),

            ListTile(
               onTap: () {
                
              },
              
              title: const Text("About us"), 
              trailing: const Icon(Icons.help_outline_rounded),
              ),
          //  Divider(),

            ListTile(
               onTap: () {
                
              },
              title: const Text("Contact us"),
              trailing: const Icon(Icons.phone_callback_rounded),
              ),
           // Divider(),

            ListTile(
              onTap: () {
                controller.logout();
                
              },
            title: const Text("Logout"), 
            trailing: const Icon(Icons.exit_to_app),),
           // Divider(),


          ],),),
       ) 
        ],
      ),);
  }
}