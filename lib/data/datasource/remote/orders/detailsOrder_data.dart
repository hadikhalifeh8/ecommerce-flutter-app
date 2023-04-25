import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrderDetailsData {

  Crud crud;
  OrderDetailsData(this.crud);

  getData(String orderid) async {
   var response = await crud.postData("${AppLink.detailsOrder}/$orderid", {});
      return response.fold((l) => l, (r) => r);
  }

}