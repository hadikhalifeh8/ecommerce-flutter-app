

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
    static const String resendVerifyCode = "http://comm-app.local/api/sendOtp";



    // ============================= ForgetPassword ============================= //
    static const String checkemail = "http://comm-app.local/api/sendOtp";
    static const String verifyCodeResetPassword = "http://comm-app.local/api/loginWithOtp";
    static const String resetPassword = "http://comm-app.local/api/reset-password";


    //==============================  Home Page ================================== //
    static const String homepage = "http://comm-app.local/api/getalldata";


     //==============================  Items Page ================================== //     
      static  String itemsbycategory = "http://comm-app.local/api/getitemsbycategory";

     // with favorite
     // static  String itemsbycategorywithusersandfavorites= "http://comm-app.local/api/favorite_users_items";

     
     //==============================  Favorites Items ================================== //     
      static  String addfavorite = "http://comm-app.local/api/addfavorite";
      static  String removefavorite = "http://comm-app.local/api/deletefavorite";


     //==============================  MY Favorites  ================================== // 
      static  String myfavorite = "http://comm-app.local/api/myfavorite";
      static  String deletemyfavorite = "http://comm-app.local/api/deletemyfavorite";

         


    
    
      
}



//////*************************************ip address**************************************** */


// class AppLink {

//   static const String test = "http://comm-app.local/api/getallusers";

//   static const String server = "http://192.168.0.110/laravel/E-commerceApp/public/api";
 

//   //================================ Images Link ========================= //
//    static const String server_image = "http://192.168.0.110/laravel/E-commerceApp/public";
//   static const String imagePath = "$server_image/attachments";
//   static const String imageCategories = "$imagePath/categories";
//  static const String imageItems = "$imagePath/items";
  
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


//      //==============================  Items Page ================================== //     
//        static  String itemsbycategory = "$server/getitemsbycategory";

// //      // with favorite
// //      // static  String itemsbycategorywithusersandfavorites= "http://comm-app.local/api/favorite_users_items";

     
// //      //==============================  Favorites Items ================================== //     
//       static  String addfavorite = "$server/addfavorite";
//        static  String removefavorite = "$server/deletefavorite";


// //      //==============================  MY Favorites  ================================== // 
//        static  String myfavorite = "$server/myfavorite";
//       static  String deletemyfavorite = "$server/deletemyfavorite";
// }