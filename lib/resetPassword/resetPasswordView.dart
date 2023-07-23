import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/resetPassword/resetPasswordController.dart';
import 'package:ok/signIn/SecondText.dart';
import 'package:ok/signIn/TextField.dart';
import 'package:ok/signIn/firstText.dart';
import 'package:get/get.dart';
import '../Functions/validatorInput.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controllerImp = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Form(
          key: controllerImp.formstate,
          child: ListView(
            children: [
              const FirstText(text: "New Password"),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 110),
                child: const SecondText(
                    text2:
                    "Please Enter New Password"),
              ),
              const SizedBox(
                height: 25,
              ),
              GetBuilder<ResetPasswordControllerImp>(
                builder:(controllerImp)=>AuthTextField(
                  obscureText: controllerImp.isShowPassword,
                  onTapIcon: (){
                    controllerImp.showPassword();
                  },
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, "Password");
                  },
                  mycontroller: controllerImp.password,
                  hintText: 'Enter your Password',
                  label: 'Password',
                  iconData: Icons.lock_outline,
                ),
              ),

              GetBuilder<ResetPasswordControllerImp>(
                builder:(controllerImp)=>AuthTextField(
                  obscureText: controllerImp.isShowPassword,
                  onTapIcon: (){
                    controllerImp.showPassword();
                  },
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, "Password");
                  },
                  mycontroller: controllerImp.password,
                  hintText: 'Re Enter your Password',
                  label: 'Re password',
                  iconData: Icons.lock_outline,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 3),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  onPressed: () {
                    controllerImp.ResetPassword();
                  },
                  color: AppColor.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.save_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Save",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
