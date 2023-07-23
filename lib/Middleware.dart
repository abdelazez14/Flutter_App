import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Services/Services.dart';
import 'package:ok/routes.dart';

class Middleware extends GetMiddleware{

 MyServices myServices = Get.find();

RouteSettings? redirect(String? route) {

if(myServices.sharedPreferences.getString("token")!=null){
  return const RouteSettings(name: AppRoutes.HomePage);
  }

}

}