import 'package:get/get.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Functions/handlingDataController.dart';
import 'package:ok/SubItems/Models.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/routes.dart';

class SubItemsController extends GetxController{
  Itemsdata itemsdata = Itemsdata(Get.find());
  List<ChildCategoryModel> typeOfElctronics =[];
   List<ChildCategoryModel> typeOfMen=[];
  List<ChildCategoryModel> typeOfWomman=[];
late StatusRequest statusRequest;
late int categoryId;



List<String> imageOfElectronics =[
  "mobiles.png",
  "laptop.png",
  "electronics.png"
];
List imageOfMen =[
 
"jackets.png",
"tshirt.png",
"jeans.png",
"shoes.png",
"accMan.png"
];
List imageOfWomman =[
"dresses.png",
"jakWoman.png",
"shoes.png",
"jenWoman.png",
"accWoman.png"
];

 
 




  Future getTypeofElectronics()async{
     statusRequest=StatusRequest.loading;
        update();
    var response=await itemsdata.getChildElectronicsCategory();
    statusRequest=handlingData(response);
   
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
  
      typeOfElctronics.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));
   
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  } 



  Future getTypeofMen()async{
     statusRequest=StatusRequest.loading;
         update();
    var response=await itemsdata.getChildMenCategory();
    statusRequest=handlingData(response);
 
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
  
      typeOfMen.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));
      
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  } 


  Future getTypeofWomman()async{
     statusRequest=StatusRequest.loading;
         update();
    var response=await itemsdata.getChildWommanCategory();
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest) {
      List responseData = response["data"];
  
      typeOfWomman.addAll(responseData.map((e) => ChildCategoryModel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  } 
 
 goItems(int? itemsId){
    Get.toNamed(AppRoutes.Items,arguments:{"itemsId":itemsId});
 }
 
  @override
  void onInit() {
   categoryId=Get.arguments["categoryId"];
  getTypeofElectronics();
   getTypeofWomman();
   getTypeofMen();
     super.onInit();
  }
} 