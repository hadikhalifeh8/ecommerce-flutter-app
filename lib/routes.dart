import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/myMiddleware.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/address/add.dart';
import 'package:ecommerce/view/address/addpart2-Details.dart';
import 'package:ecommerce/view/address/view.dart';
import 'package:ecommerce/view/screen/OnBoarding.dart';
import 'package:ecommerce/view/screen/auth/SuccessSignUp.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/resetPassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/succesResetPassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/verifyCode.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myFavorite.dart';
import 'package:ecommerce/view/screen/productDetails.dart';




import 'package:get/get_navigation/src/routes/get_route.dart';


// for getx

List<GetPage<dynamic>>? routes =[

     GetPage(name: "/", page: () =>const Language(), middlewares: [MyMiddleware() ]),
   // GetPage(name: "/", page: () =>const Cart()),

 // GetPage(name: "/", page: () => const TestDataView()),

  //Auth
  GetPage(name: AppRoute.login, page: () =>const Login()),
  GetPage(name: AppRoute.signUp, page: () =>const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () =>const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () =>const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () =>const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () =>const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () =>const SuccessSignUp()),
  GetPage(name: AppRoute.verifycodesignup, page: () =>const VerifyCodeSignUp()),
  
    //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () =>const OnBoarding()),

  // Home Page
  // GetPage(name: AppRoute.homepage, page: () =>const Home()),
  
  GetPage(name: AppRoute.homepage, page: () =>const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Item_s()),

// Products Detail
 GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()), //itemsDetails

 // Favorites Page
 GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()), 

  // Cart Page
 GetPage(name: AppRoute.mycart, page: () => const Cart()), 


   // address pages
 GetPage(name: AppRoute.addressView, page: () => const AddressView()), 
 GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()), 
 GetPage(name: AppRoute.addressaddpart2, page: () => const AddressAddPart2_Details()), 



   


];


/*
//for flutter عادي
Map<String, Widget Function(BuildContext)> routess = {
  
    //Auth
  AppRoute.login : (context) => const Login(),
  AppRoute.signUp : (context) => const SignUp(),
  AppRoute.forgetPassword : (context) => const ForgetPassword(),
  AppRoute.verifyCode : (context) => const VerifyCode(),
  AppRoute.resetPassword : (context) => const ResetPassword(),
  AppRoute.successResetPassword : (context) => const SuccessResetPassword(),
  AppRoute.successSignUp : (context) => const SuccessSignUp(),
  AppRoute.verifycodesignup : (context) => const VerifyCodeSignUp(),

    //OnBoarding
  AppRoute.onBoarding : (context) => const OnBoarding(),
 

}; */