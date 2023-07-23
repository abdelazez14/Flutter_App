/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartItems.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/productdetails/ProductdeatailsModel.dart';
import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';

class ProductDetailsControllerImp extends GetxController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<ProductDeatailsModel> productDetails = [];
  List<Similar> similar = [];
  CartItem? cartItem;
  List<Widget> sentenceWidgets = [];

  intialData() {
    cartItem = CartItem(
      id: productDetails.first.id!,
      title: productDetails.first.name!,
      price: productDetails.first.price!,
      image: "${AppLink.apiImage}${productDetails.first.image!.first.photo!}",
      count: 1,
    );
  }

  Future getProductDeatails(int productID) async {
   // final circleShape= Container(
   //    margin: EdgeInsets.all(100.0),
   //    decoration: BoxDecoration(
   //        color: Colors.black,
   //        shape: BoxShape.circle
   //    ),
   //  );
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsdata.getProductDeatails(productID);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      List similarData = response["similar"];
      productDetails.clear();
      similar.clear();
      productDetails
          .addAll(responseData.map((e) => ProductDeatailsModel.fromJson(e)));
      String desc = productDetails.first.discription!;
      List<String> sentences = desc.split(", ");
      for (int i = 0; i < sentences.length; i++) {
        if (i > 0 && sentences[i].startsWith(',')) {
          sentenceWidgets.add(Text(
            '\n  ${sentences[i]}',
            style: const TextStyle(fontSize: 16),
          ));
        } else {
          sentenceWidgets.add(Text(
            "." + sentences[i],
            style: const TextStyle(fontSize: 16),
          ));
        }
      }

      intialData();
      similar.addAll(similarData.map((e) => Similar.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    int productId = Get.arguments["ProductsId"];
    getProductDeatails(productId);
    super.onInit();
  }
}
// class CirclePoint extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 20, // Adjust the width and height as per your requirements
//       height: 20,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.blue, // Adjust the color as per your requirements
//       ),
//     );
//   }
// }*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartItems.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/itemsData.dart';
import 'package:ok/productdetails/ProductdeatailsModel.dart';
import '../CrudApi/StatusRequest.dart';
import '../Functions/handlingDataController.dart';

class ProductDetailsControllerImp extends GetxController {
  Itemsdata itemsdata = Itemsdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<ProductDeatailsModel> productDetails = [];
  List<Similar> similar = [];
  CartItem? cartItem;
  List<Widget> sentenceWidgets = [];

  intialData() {
    cartItem = CartItem(
      id: productDetails.first.id!,
      title: productDetails.first.name!,
      price: productDetails.first.price!,
      image: "${AppLink.apiImage}${productDetails.first.image!.first.photo!}",
      count: 1,
    );
  }

  Future getProductDeatails(int productID) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsdata.getProductDeatails(productID);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response["data"];
      List similarData = response["similar"];
      productDetails.clear();
      similar.clear();
      productDetails
          .addAll(responseData.map((e) => ProductDeatailsModel.fromJson(e)));
      String desc = productDetails.first.discription!;
      List<String> sentences = desc.split(", ");
      for (int i = 0; i < sentences.length; i++) {
        if (i > 0 && sentences[i].startsWith(',')) {
          sentenceWidgets.add(Text(
            '\n  ${sentences[i]}',
            style: const TextStyle(fontSize: 16),
          ));
        } else {sentenceWidgets. add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment. start,
            children: [
              Align(
                alignment: Alignment. topLeft,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape. circle,
                    color: Colors. black,
                  ),
                ),
              ),
              SizedBox(width: 5), // Adjust the spacing as per your requirements
              Expanded(
                child: Align(
                  alignment: Alignment. topLeft,
                  child: Text(
                    sentences[i],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ));
        }
      }

      intialData();
      similar.addAll(similarData.map((e) => Similar.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    int productId = Get.arguments["ProductsId"];
    getProductDeatails(productId);
    super.onInit();
  }
}