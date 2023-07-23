import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/Forget_Password/ForgetPassword_Controller.dart';
import 'package:ok/Functions/validatorInput.dart';
import 'package:ok/signIn/SecondText.dart';
import 'package:ok/signIn/TextField.dart';
import 'package:ok/signIn/firstText.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetControllerImp controllerImp = Get.put(ForgetControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        title: const Text(
          "Forget Password",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Form(
          key:controllerImp.formstate ,
          child: ListView(
            children: [
              const FirstText(text: "Check Your Email"),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 110),
                child: const SecondText(
                    text2:
                    "Please Enter Your Email Address to get new password"),
              ),
              const SizedBox(
                height: 25,
              ),
              AuthTextField(
                isNumber: false,
                valid: (val ) {
                  return validInput(val!, 5, 100, "Email");
                },
                mycontroller: controllerImp.email,
                hintText: 'Enter your Email',
                label: 'Email',
                iconData: Icons.email_outlined,
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
                    controllerImp.checkEmail();
                  },
                  color: AppColor.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Check",
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
