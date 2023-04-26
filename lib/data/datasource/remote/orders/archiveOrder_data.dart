import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrderData {

  Crud crud;
  ArchiveOrderData(this.crud);

  getData(String usersid) async {
   var response = await crud.postData('${AppLink.archiveOrder}/$usersid', {});
      return response.fold((l) => l, (r) => r);
  }

}