
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/notification/notification.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenconroller extends GetxController{

changePage(int currentpage);

}

class HomeScreenconrollerImp extends HomeScreenconroller{

  int currentpage = 0; 

// list of pages
List<Widget> listPage =[
 const Home(),

//  Column(children: const [
//   Center(child: Text("notification")),
//  ],),
 const NotificationView(),

 Column(children: const [
  Center(child: Text("profile")),
 ],),

 const Settings(),

];


List listBottomAppBar = [
   // group of maps
  { "title" : "home", "icon" : Icons.home,},
  {"title" : "notifications", "icon" : Icons.notification_important_outlined,}, 
  {"title" : "profile", "icon" : Icons.person_pin_sharp,},
  {"title" : "setting", "icon" : Icons.settings,}


];

  @override
  changePage(int inde_x) {
       currentpage = inde_x;
       update();
  }

}

