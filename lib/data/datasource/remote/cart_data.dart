import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {

  Crud crud;
  CartData(this.crud);

  
   addcart(String? usersid, String itemsid) async {
    var response = await crud.postData('${AppLink.addcart}/$usersid/$itemsid', {

   });
      return response.fold((l) => l, (r) => r);
  }


    deletecart(String? usersid, String itemsid) async {
    var response = await crud.postData('${AppLink.deletecart}/$usersid/$itemsid', {

   });
      return response.fold((l) => l, (r) => r);
  }



      getItemsCountCart(String? usersid, String itemsid) async {
    var response = await crud.postData('${AppLink.getItemsCountCart}/$usersid/$itemsid', {

   });
      return response.fold((l) => l, (r) => r);
  }


        cartView(String? usersid,) async {
    var response = await crud.postData('${AppLink.viewCartpage}/$usersid', {

   });
      return response.fold((l) => l, (r) => r);
  }
 
}


 