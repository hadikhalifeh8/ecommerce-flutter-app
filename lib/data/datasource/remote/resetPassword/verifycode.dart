import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeForgetPasswordData {

  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postdata( String email, String verifycode ) async {
   // var response = await crud.postData(linkurl, {})
   var response = await crud.postData(AppLink.verifyCodeResetPassword, { 

            
            "email" : email , 
            "verify_code" : verifycode, 

   });
      return response.fold((l) => l, (r) => r);
  }

}