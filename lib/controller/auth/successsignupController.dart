import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLoginPage();
}

  class   SuccessSignUpControllerImp extends SuccessSignUpController {
  
    @override
  goToLoginPage() {
   Get.offAllNamed(AppRoute.login);
  }
  }