import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/HomeScreen/CustombottomAppBarhome.dart';
import 'package:ok/HomeScreen/homeScreenController.dart';
import 'package:ok/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.Cart);
          },
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
