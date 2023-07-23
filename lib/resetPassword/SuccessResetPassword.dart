import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/resetPassword/resetPasswordController.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controllerImp =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        title: const Text(
          "Success",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "The new password is saved",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Data Fetch Correctly",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              const Spacer(),
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
                    controllerImp.GotoLogin();
                  },
                  color: AppColor.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Go To Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
