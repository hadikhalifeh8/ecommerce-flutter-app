

class AppLink {

 static const String test = "http://comm-app.local/api/getallusers";

  static const String server = "http://comm-app.local/api/getallusers";

  //================================ Images Link ========================= //
  static const String imagePath = "http://comm-app.local/attachments";
  static const String imageCategories = "$imagePath/categories";
  static const String imageItems = "$imagePath/items";
 
  
   ///////////////////////////////////// Auth ////////////////////////////////
  
    static const String signUp = "http://comm-app.local/api/register";
    static const String login = "http://comm-app.local/api/login";
    static const String verifycodesignup = "http://comm-app.local/api/loginWithOtp";


    // ============================= ForgetPassword ============================= //
    static const String checkemail = "http://comm-app.local/api/sendOtp";
    static const String verifyCodeResetPassword = "http://comm-app.local/api/loginWithOtp";
    static const String resetPassword = "http://comm-app.local/api/reset-password";


    //==============================  Home Page ================================== //
    static const String homepage = "http://comm-app.local/api/getalldata";


     //==============================  Items Page ================================== //
    
    // static  String itemsbycategory = "http://comm-app.local/api/getitemsbycategory";
     
     static  String itemsbycategory = "http://comm-app.local/api/getitemsbycategory";
     
     
    
    
      
}



// class AppLink {

//  static const String test = "http://comm-app.local/api/getallusers";

//   static const String server = "192.168.0.100/api";

//   //================================ Images Link ========================= //
//   static const String imagePath = "$server/attachments";
//   static const String imageCategories = "$imagePath/categories";
 
  
//    ///////////////////////////////////// Auth ////////////////////////////////
  
//     static const String signUp = "$server/register";
//     static const String login = "$server/login";
//     static const String verifycodesignup = "$server/loginWithOtp";


//     // ============================= ForgetPassword ============================= //
//     static const String checkemail = "$server/sendOtp";
//     static const String verifyCodeResetPassword = "$server/loginWithOtp";
//     static const String resetPassword = "$server/reset-password";


//     //==============================  Home Page ================================== //
//     static const String homepage = "$server/getalldata";
// }