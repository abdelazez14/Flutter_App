import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class CheckOutController extends GetxController{
  late var total;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController address= TextEditingController();


  gotoSuccessCheckOut(){
    Get.offNamed(AppRoutes.SuccessCheckOut);
  }

  void dispose() {
    address.dispose();
    super.dispose();
  }
  @override
  void onInit() {
    total=Get.arguments["total"];
    super.onInit();
  }
}