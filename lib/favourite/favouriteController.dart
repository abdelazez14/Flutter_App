import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Services/Services.dart';
import 'package:ok/favourite/favourite.dart';
import 'package:ok/items/ModelProduct.dart';
import 'package:ok/routes.dart';

import '../Functions/handlingDataController.dart';

class FavouriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavouriteData favouriteData = FavouriteData(Get.find());
  MyServices myServices = Get.find();
  bool active = false;
  List<ProductModel> userFav = [];
  Map setFavourite = {};
  int val = 0;

  onPressedIcon(int id) {
    for (int index = 0; index < userFav.length; index++) {
      if (userFav[index].id == id) {
        deletefromFavourite(id.toString());
        return true;
      }
    }
      addtoFavourite(id.toString());
       return false;
  }

  
  check(int id) {
    for (int index = 0; index < userFav.length; index++) {
      if (userFav[index].id == id) {
        return true;
      }
    }
    return false;
  }

  Future addtoFavourite(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData.addToFavourite(
        myServices.sharedPreferences.getString("token")!, id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      String responseData = response["data"];
      Get.snackbar("Response", responseData,backgroundColor: AppColor.primaryColor,colorText:Colors.white);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future deletefromFavourite(String id) async {
    update();
    var response = await favouriteData.deleteFromFavourite(
    myServices.sharedPreferences.getString("token")!, id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      String responseData = response["data"];
      Get.snackbar("Response", responseData,backgroundColor: AppColor.primaryColor,colorText:Colors.white);

    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future userFavourite() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData
        .userFavourite(myServices.sharedPreferences.getString("token")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      userFav.addAll(responseData.map((e) => ProductModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }



  GoToProduct(int productsId) {
    Get.toNamed(AppRoutes.Products,
        arguments: {"ProductsId": productsId});
  }

  @override
  void onInit() {
    userFavourite();
    super.onInit();
  }
}
