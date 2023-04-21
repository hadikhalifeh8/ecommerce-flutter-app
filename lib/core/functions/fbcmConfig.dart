// هوي ومفتوح Notification فيني إستقبل function إذا كان التطبيق مفتوح بصير من خلال هيدي ال 
import 'package:ecommerce/controller/pages/orders/pendingOrders_Controller.dart';
import 'package:ecommerce/core/constant/Color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissinNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
}

fbcmconfig(){
FirebaseMessaging.onMessage.listen((message) {
  print("++======================= Notification ========================++");

  print(message.notification!.title);
  print(message.notification!.body);

  // firebase ringtone player
  FlutterRingtonePlayer.playNotification(); // for sound

// notificatio 
  Get.snackbar(
                backgroundColor: Colors.red, colorText: Colors.white, 
                message.notification!.title!.toString(),
                message.notification!.body!.toString(),
           
               );
// for admin
      // Pending Order تحديدا لما كون داخل صفحة ال   refresh بعمل ضغري 
      // hayde lfunction bs lamma koon b saf7et pending orders
    refreshPageNotification(message.data); // message.data ==> pageid-pagename in laravel function 
    

});
}

refreshPageNotification(data)
{
print("====================Page id ==============================");
print(data['pageid']); // from api /bulksend/appovedorder =>admin

print("====================Page name ==============================");
print(data['pagename']); // from api /bulksend/appovedorder =>admin



print("====================Current page ==============================");
print(Get.currentRoute); // get the name of the current page .

if(Get.currentRoute =="/pendingOrders"  &&  data['pagename'] == "refreshorderpending") // data['pagename'] == "refreshorderpending" from api (approvedorder)
  print("==================== refresh order ==============================");

// pendingOrders_Controller
OrdersPendingController controller = Get.put(OrdersPendingController());
controller.refreshOrder();
}

// Firebase + stream 
// socket io 
// Notification resh
