import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ok/routes.dart';

import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';
import '../items/ModelProduct.dart';
import '../items/itemsData.dart';
import 'model.dart';

class HomeControllerImp extends GetxController {
  List<ProductModel> searchData = [];
  TextEditingController searchController = TextEditingController();
  Itemsdata itemsdata = Itemsdata(Get.find());
  bool isSearch = false;
  List<ParentCategoryModel> parentcategory = [];
  late StatusRequest statusRequest;
  List<ProductModel> cursorImage = [];
  List<ProductModel> bestSellerData = [];

  onChange(String val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    search();
    update();
  }

  Future getParentCategory() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getParentCategory();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      parentcategory
          .addAll(responseData.map((e) => ParentCategoryModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future getCursorData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getCursorData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      cursorImage.addAll(responseData.map((e) => ProductModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future getBestSellerData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getBestSellerData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      bestSellerData.addAll(responseData.map((e) => ProductModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future search() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsdata.search(searchController.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      searchData.clear();
      List responseData = response["data"];

      searchData.addAll(responseData.map((e) => ProductModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  GoToProduct(int productsId) {
    Get.toNamed(AppRoutes.Products, arguments: {"ProductsId": productsId});
  }

  List<SvgPicture> svgPicture = [
    SvgPicture.asset(
      "assets/svgs/men.svg",
      width: 55,
      height: 50,
    ),
    SvgPicture.asset(
      "assets/svgs/heels.svg",
      width: 50,
      height: 45,
    ),
    SvgPicture.asset(
      "assets/svgs/devices.svg",
      width: 50,
      height: 45,
    ),
  ];

  gotoSubItems(categoryId) {
    Get.toNamed(AppRoutes.subItems, arguments: {"categoryId": categoryId});
  }

  @override
  void onInit() {
    getBestSellerData();
    getCursorData();
    getParentCategory();
    super.onInit();
  }
}
