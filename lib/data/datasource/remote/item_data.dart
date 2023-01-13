import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {

  Crud crud;
  ItemsData(this.crud);

  getData(String? categoryid) async {
  // getData( String? usersid, String? categoryid ) async {
   
  
    var response = await crud.postData('${AppLink.itemsbycategory}/$categoryid', {
   //var response = await crud.postData('${AppLink.itemsbycategorywithusersandfavorites}/$usersid/$categoryid/$itemsid', {


      // "users_id" : usersid.toString() ,  
      // "categories_id" : categoryid.toString() , // categories_id request from Api backend --> categoryid from string value
     //  "items_id" : itemsid.toString() ,
   
   });
      return response.fold((l) => l, (r) => r);
  }
 
}


 