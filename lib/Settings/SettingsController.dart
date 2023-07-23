import 'package:get/get.dart';
import 'package:ok/routes.dart';

class SettingsController extends GetxController{

  Logout(){
    Get.offNamed(AppRoutes.SignIn);
  }
}