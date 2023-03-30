import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeSignUpData {

  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postdata( String email, String verifycode ) async {  
   var response = await crud.postData(AppLink.verifycodesignup,{     // loginWithOTP function

            "email" : email,   
            "verify_code" : verifycode , 
           
   });
      return response.fold((l) => l, (r) => r);
  }

  resendVerifyCodeData(String email) async{

     var response = await crud.postData(AppLink.resendVerifyCode,{     // loginWithOTP function

            "email" : email,   
            
           
   });
      return response.fold((l) => l, (r) => r);

  }

}