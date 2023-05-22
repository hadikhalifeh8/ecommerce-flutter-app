import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrderData {

  Crud crud;
  ArchiveOrderData(this.crud);

  getData(String usersid) async {
   var response = await crud.postData('${AppLink.archiveOrder}/$usersid', {});
      return response.fold((l) => l, (r) => r);
  }



    // rating(String orderid, String rating, String comment) async {
    rating(String orderid, String rating, String comment) async {
   var response = await crud.postData('${AppLink.rating}/$orderid', {
    'order_rating': rating, 
    'order_note_rating': comment,
   });
      return response.fold((l) => l, (r) => r);
  }

}