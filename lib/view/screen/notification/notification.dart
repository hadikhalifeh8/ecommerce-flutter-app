import 'package:ecommerce/controller/pages/notification/notificationController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

NotificationController controller = Get.put(NotificationController());

    return Container(
      child: GetBuilder<NotificationController>(builder: (controlller) => 
      HandlingDataView( 
                   statusRequest: controller.statusRequest,
                   widget: Container(
        child: ListView(
          children: [

            Center(child: Text("Notifications", style: TextStyle(color: AppColor.primaryColor, fontSize: 22,fontWeight: FontWeight.bold),),),

   const SizedBox(height: 20.0,),
   
    ...List.generate(
                     controller.data.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                       child: ListTile(
                              title: Text(controller.data[index]['title']), // get title from database/model ما عملتش 
                              subtitle: Text(controller.data[index]['body']),// get title from database/model ما عملتش 
                              trailing: Text(Jiffy(controlller.data[index]['created_at'], "yyyy-MM-dd").fromNow(), style: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
                             // leading: Text(controller.data[index]['id'].toString()),
                       ),
                     ),
                     

                     
                      ),
      ],),
      ),))
    );
  }
}