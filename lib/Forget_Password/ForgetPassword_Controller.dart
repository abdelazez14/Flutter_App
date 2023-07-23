import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/routes.dart';


abstract class  ForgetPasswordController extends GetxController{
  checkEmail();
  GotoResetPassword();
}
class ForgetControllerImp extends ForgetPasswordController{
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController email;


  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  @override
  checkEmail() {
    var formdata=formstate.currentState;
    if(formdata!.validate() ){
      Get.toNamed(AppRoutes.resetPassword);
    }else{
      print("Not Valid");
    }
  }

  @override
  GotoResetPassword() {

  }

}