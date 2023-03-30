import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {

  Crud crud;
  FavoriteData(this.crud);

  
   addFavorite(String? usersid, String itemsid) async {
    var response = await crud.postData('${AppLink.addfavorite}/$usersid/$itemsid', {

    // 'users_id': usersid.toString(),
    
    // 'items_id' : itemsid.toString(),

   });
      return response.fold((l) => l, (r) => r);
  }



    deleteFavorite(String? usersid, String itemsid) async {
    var response = await crud.postData('${AppLink.removefavorite}/$usersid/$itemsid', {
       
      // 'users_id': usersid.toString(),
    
      // 'items_id' : itemsid.toString(),

   });
      return response.fold((l) => l, (r) => r);
  }
 
}


 