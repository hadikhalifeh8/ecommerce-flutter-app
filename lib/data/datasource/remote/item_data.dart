import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {

  Crud crud;
  ItemsData(this.crud);

  getData(String? id) async {
   
    // var response = await crud.postData(AppLink.itemsbycategory +'/'+'$id', {

   var response = await crud.postData('${AppLink.itemsbycategory}/$id', {

       "category_" : id.toString() ,  // categoryid_ request from Api backend --> categoryid from string value
   });
      return response.fold((l) => l, (r) => r);
  }
 
}


 