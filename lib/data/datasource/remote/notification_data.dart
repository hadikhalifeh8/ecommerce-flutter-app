import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class NotificationData {

  Crud crud;
  NotificationData(this.crud);

  getData(String user_id) async {
   var response = await crud.postData("${AppLink.getAllnotification}/$user_id", {});
      return response.fold((l) => l, (r) => r);
  }

}