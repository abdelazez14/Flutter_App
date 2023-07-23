import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/routes.dart';


abstract class  ResetPasswordController extends GetxController{
  ResetPassword();
  GotoSuccessReset();
  GotoLogin();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController Repassword;
  bool isShowPassword=true;

  showPassword(){
    isShowPassword=isShowPassword ==true?false:true;
    update();
  }


  @override
  void onInit() {
    password=TextEditingController();
    Repassword=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    Repassword.dispose();
    super.dispose();
  }

  @override
  ResetPassword() {
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      Get.toNamed(AppRoutes.successReset);
    }else{
      print("Not Valid");
    }
  }

  @override
  GotoSuccessReset() {
    Get.offNamed(AppRoutes.successReset);
  }

  @override
  GotoLogin() {
    Get.offNamed(AppRoutes.SignIn);
  }
}