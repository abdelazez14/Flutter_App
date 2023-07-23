import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Functions/handlingDataController.dart';
import 'package:ok/SignUp/SignupData.dart';
import 'package:ok/routes.dart';

class SignUpControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username ;
  late TextEditingController email ;   
  late TextEditingController password ; 
  bool isShowPassword =true;
  SignUpData signUpData = SignUpData(Get.find());
   StatusRequest statusRequest=StatusRequest.none;
 
 showPassword(){
   isShowPassword=isShowPassword==true?false:true;
   update();
 }
signUp() async {
   if (formstate.currentState!.validate()) {
       var response =
          await signUpData.postData(username.text, email.text, password.text);
      print(response);
      var handlingdata = handlingData(response);
      print(response["message"]);
      if (handlingdata == StatusRequest.success) {
        if (response["message"] == "The email has already been taken.") {
          return Get.snackbar(
            "warning",
            "The email has already been taken !",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.primaryColor,
          );
        } else if (response["token"]!=null) {
          Get.offNamed(AppRoutes.SignIn);
          Get.snackbar(" Response ", " your account created sucessfully ! ",backgroundColor: AppColor.primaryColor,colorText: Colors.white,
          duration:Duration(seconds:2)
          );
        }else if(response["message"]=="The name field is required. (and 2 more errors)"){
          return Get.snackbar(
            "warning",
            "The name field is required. (and 2 more errors)",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.primaryColor,
          );
        }
         else {
          return statusRequest == StatusRequest.serverfailure;
        }
      } else {
        return statusRequest == StatusRequest.failure;
      }
    }else {
      print("Not Valid");}
        update();
    } 
  

 @override
 void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }


  gotoLogin() {
    Get.offNamed(AppRoutes.SignIn);
  }

  @override
  void onInit(){
    username=TextEditingController(); 
    email=TextEditingController(); 
    password=TextEditingController(); 
    signUp();
    super.onInit();
  }

}