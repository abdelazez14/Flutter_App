// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/Functions/alertExitApp.dart';
import 'package:ok/Functions/validatorInput.dart';
import 'package:ok/signIn/SecondText.dart';
import 'package:ok/signIn/SignIn_controller.dart';
import 'package:ok/signIn/TextField.dart';
import 'package:ok/signIn/firstText.dart';
import 'package:get/get.dart';
import 'logo.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Form(
            key: controllerImp.formstate,
            child: ListView(
              children: [
                const LogoAuth(),
                const FirstText(text: "Welcome Back"),
                const SizedBox(
                  height: 10,
                ),

                 Container(
                   margin: const EdgeInsets.symmetric(horizontal: 40),
                   child: const SecondText(
                       text2:
                           "log in to your excitations account"),
                 ),
                const SizedBox(
                  height: 25,
                ),
                AuthTextField(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "Email");
                  },
                  mycontroller: controllerImp.email,
                  hintText: 'Enter your Email',
                  label: 'Email',
                  iconData: Icons.email_outlined,
                ),
                GetBuilder<LoginControllerImp>(
                    builder:(controllerImp)=>AuthTextField(
                      obscureText: controllerImp.isShowPassword,
                      onTapIcon: (){
                        controllerImp.showPassword();
                      },
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "Password");
                      },
                      mycontroller:controllerImp.password,
                      hintText: 'Enter your Password',
                      label: 'Password',
                      iconData:controllerImp.isShowPassword?  Icons.visibility_off :Icons.visibility,
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    onPressed: () {
                      controllerImp.signIn();
                    },
                    color: AppColor.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Don`t have an account ?",style: TextStyle(fontSize: 10),),
                      InkWell(
                        onTap: () => controllerImp.GoToSignUp(),
                        child: const Text(
                          " Sign Up ",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

