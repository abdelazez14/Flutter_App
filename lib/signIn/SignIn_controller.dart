import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Services/Services.dart';
import 'package:ok/routes.dart';
import 'package:ok/signIn/SignInData.dart';

import '../Functions/handlingDataController.dart';


class LoginControllerImp extends GetxController{
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
 late TextEditingController email;
 late TextEditingController password;
 bool isShowPassword=true;
  SigninData signinData = SigninData(Get.find());
    StatusRequest statusRequest=StatusRequest.none;
 MyServices myServices =Get.find();
 showPassword(){
   isShowPassword=isShowPassword ==true?false:true;
   update();
 }

signIn() async {
   if (formstate.currentState!.validate()) {
       var response =
          await signinData.postData(email.text, password.text);
      print(response);
      var handlingdata = handlingData(response);
      if (handlingdata == StatusRequest.success) {
        if(response["status"]==200){
          var token = response["token"];
          myServices.sharedPreferences.setString("token", token);
          Get.offNamed(AppRoutes.HomePage);
        }
    }else {
        Get.snackbar("Alert", "The email or password is incorrect try again",
            colorText:Colors.white,backgroundColor: AppColor.primaryColor);
      }
    
    }else {
      print("Not Valid");}
        update(); 

}




  @override
  void onInit() {
email=TextEditingController();
password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
 

  GoToSignUp() {
    Get.offNamed(AppRoutes.SignUp);
  }

  GotoForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }


}