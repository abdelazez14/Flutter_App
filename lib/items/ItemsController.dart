 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/items/ModelProduct.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/routes.dart';

import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';
 

class ItemsControllerImp extends GetxController{

    List<ProductModel> searchData=[];
   TextEditingController searchController =TextEditingController() ;
  Itemsdata itemsdata=Itemsdata(Get.find());
  List<ProductModel> data =[];
  late StatusRequest statusRequest;
 bool isSearch = false ;
   late int itemsID;


  onChange(String val){
    if(val==""){
      isSearch=false;
    }
    update();
  }

  onSearch(){
    isSearch=true;
    search();
    update();
  }



  Future getItems(int itemsID)async{
    statusRequest=StatusRequest.loading;
    var response=await itemsdata.getProduct(itemsID);
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
       data.addAll(responseData.map((e) => ProductModel.fromJson(e)));
    }else{
        statusRequest=StatusRequest.failure;
      }
    update();
    }

   Future search()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await itemsdata.search(searchController.text);
     statusRequest=handlingData(response);
     if(StatusRequest.success == statusRequest) {
       searchData.clear();
      List responseData = response["data"];

       searchData.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  
  }
  
  GoToProduct(int productsId){
    Get.toNamed(AppRoutes.Products,arguments: {"ProductsId":productsId});
  }
  GoToFavourite(){
    Get.toNamed(AppRoutes.Favourite);
  
  
  }

  @override
  void onInit() {
  itemsID=Get.arguments["itemsId"];
  print(itemsID);
    getItems(itemsID);
    super.onInit();
  }



}