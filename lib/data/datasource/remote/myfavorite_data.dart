import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class MyFavoriteData {

  Crud crud;
  MyFavoriteData(this.crud);

  myFavoritegetData(String userid) async {
   var response = await crud.postData('${AppLink.myfavorite}/$userid', {});
      return response.fold((l) => l, (r) => r);
  }


    deleteData(String favoritesid) async {
   var response = await crud.postData('${AppLink.deletemyfavorite}/$favoritesid', {

   // 'favoriteid' : favoriteid,
   });
      return response.fold((l) => l, (r) => r);
  }

}