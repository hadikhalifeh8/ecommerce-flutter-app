import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CheckOutData {

  Crud crud;
  CheckOutData(this.crud);

 //checkout(String userid, String addressid, String orderType, String paymentMethod, String priceDelivery, String orderPrice, String usedCoupon) async {

checkout(Map datas) async {

   var response = await crud.postData(AppLink.checkOut_, datas
   
    // 'order_type' :orderType,
    // 'payment_method' : paymentMethod,
    // 'order_price_delivery':priceDelivery,
    // 'order_price': orderPrice,
    // 'used_coupon':usedCoupon,

   );
      return response.fold((l) => l, (r) => r);
  }

}