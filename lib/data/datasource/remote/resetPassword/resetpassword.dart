import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ResetPasswordData {

  Crud crud;
  ResetPasswordData(this.crud);

  postdata( String email, String password ) async {
   // var response = await crud.postData(linkurl, {})
   var response = await crud.postData(AppLink.resetPassword, { // data from backend(nafs l 2asma2)

            
            "email" : email , //   email from backend / php:email from controller
            "password" : password, // password from backend / php : password from controller

   });
      return response.fold((l) => l, (r) => r);
  }

}