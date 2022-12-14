
import 'package:ecommerce/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeScreenconroller extends GetxController{

changePage(int currentpage);

}

class HomeScreenconrollerImp extends HomeScreenconroller{

  int currentpage = 0; 

// list of pages
List<Widget> listPage =[
 const Home(),

 Column(children: [
  Center(child: Text("Settings")),
 ],),

 Column(children: [
  Center(child: Text("profile")),
 ],),

 Column(children: [
  Center(child: Text("favorite")),
 ],),


];


List listTitleBottomAppBar = [
  "home",
  "Settings",
  "Profile",
  "Favorite",
];

  @override
  changePage(int inde_x) {
       currentpage = inde_x;
       update();
  }

}

