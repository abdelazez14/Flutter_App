import 'package:flutter/material.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/SignUp/SignUp_controller.dart';
import 'package:ok/signIn/SecondText.dart';
import 'package:ok/signIn/TextField.dart';
import 'package:ok/signIn/firstText.dart';
import 'package:get/get.dart';
import 'package:ok/signIn/logo.dart';

import '../AppColors.dart';
import '../Functions/alertExitApp.dart';
import '../Functions/validatorInput.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, color: AppColor.primaryColor),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder:(controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const FirstText(text: "Welcome to BuyBuy"),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 110),
                    //   child: const SecondText(
                    //       text2:
                    //           "Sign Up With your Email and Password OR Continue With Social Media"),
                    // ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextField(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 50, "Username");
                      },
                      mycontroller: controller.username,
                      
                      hintText: 'Enter your Username',
                      label: 'Username',
                      iconData: Icons.personal_injury_outlined,
                    ),
                    AuthTextField(
                      isNumber: false,
                      valid: (val) {
                     
                        return validInput(val!, 5, 100, "Email");
                      },
                      mycontroller: controller.email,
                      hintText: 'Enter your Email',
                      label: 'Email',
                      iconData: Icons.email_outlined,
                    ),
                    AuthTextField(
                      obscureText: controller.isShowPassword,
                      onTapIcon: (){
                        controller.showPassword();
                      },
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "Password");
                      },
                      mycontroller: controller.password,
                      hintText: 'Enter your Password',
                      label: 'Password',
                      iconData:controller.isShowPassword? Icons.visibility_off:Icons.visibility,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        onPressed:() {
                            controller.signUp();
                         },
                        
                        color: AppColor.primaryColor,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(" have an account ?",style: TextStyle(fontSize: 10),),
                        InkWell(
                          onTap: () => controller.gotoLogin(),
                          child: const Text(
                            " Sign In ",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
