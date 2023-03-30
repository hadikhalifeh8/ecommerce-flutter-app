import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class AddressData {

  Crud crud;
  AddressData(this.crud);

  getData(String usersid ) async {
   var response = await crud.postData('${AppLink.viewaddress}/$usersid', {

   });
      return response.fold((l) => l, (r) => r);
  }




  addData(String usersid, String name, String city, String street, String lat, String long) async {
      var response = await crud.postData('${AppLink.addaddress}/$usersid', {

    'address_name' : name,
    'city' : city,
    'street' : street,
    'adress_latitude' : lat,
    'adress_longitude' : long,

   });
      return response.fold((l) => l, (r) => r);
  }




  DeleteData(String addressid,) async {
     var response = await crud.postData('${AppLink.deleteaddress}/$addressid', {});
      return response.fold((l) => l, (r) => r);
  }



}