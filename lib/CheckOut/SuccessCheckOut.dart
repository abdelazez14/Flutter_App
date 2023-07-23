import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartController.dart';
import 'package:ok/routes.dart';
import '../AppColors.dart';
class SuccessCheckOut extends StatelessWidget {
  const SuccessCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children:  [
              const Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,),
              const SizedBox(height: 15,),
              const Text(" Successfully payed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              const SizedBox(height: 10,),
              const Text("Thank You For Visiting",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
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
                    Get.offNamed(AppRoutes.HomePage);
                  },
                  color: AppColor.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Go to Home Page ",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
