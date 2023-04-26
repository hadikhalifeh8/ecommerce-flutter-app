import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersPendingData {

  Crud crud;
  OrdersPendingData(this.crud);

  getData(String usersid) async {
   var response = await crud.postData('${AppLink.pendingOrder}/$usersid', {});
      return response.fold((l) => l, (r) => r);
  }



  // delete the order where status =>Await Approve (Only) 
   deleteData(String orderid) async {
   var response = await crud.postData('${AppLink.deleteOrder}/$orderid', {});
      return response.fold((l) => l, (r) => r);
  }

}