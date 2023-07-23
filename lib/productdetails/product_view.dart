// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartController.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/productdetails/productDetailsView/priceAndcount.dart';
import 'package:ok/productdetails/productDetailsView/topPageProductdetails.dart';
import 'package:ok/productdetails/productdetails_controller.dart';
import '../AppColors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    CartController controllerCart = Get.put(CartController(), permanent: true);

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) => MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColor.secondColor,
                  onPressed: () {
                    controllerCart.addToCart(
                        controller.cartItem!, controller.cartItem!.id);
                    Get.snackbar("Response",
                        "Your Product ( ${controller.productDetails.first.name} ) added to your Cart",
                        colorText: Colors.white,
                        backgroundColor: AppColor.primaryColor);
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (control) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.productDetails.isEmpty
                ? const CircularProgressIndicator()
                : ListView(children: [
                    const TopProductPageDetails(),
                    const SizedBox(
                      height: 110,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${control.productDetails.first.name}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            Divider(
                              height: 10,
                              thickness: 2,),
                            const SizedBox(height: 10),
                            IntrinsicHeight(
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,// option(1)
                                children: [
                                  Text(
                                    "${controller.productDetails.first.attributes!.first.name}: ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    "${controller.productDetails.first.attributes!.first.value}",
                                    style: TextStyle(
                                        fontSize: 10, color: AppColor.nameColor),),

                              // SizedBox(width: 40),
                                Spacer(),//  option(2)
                                  VerticalDivider(
                                    thickness: 2, //thickness of divier line
                                  ),
                                  SizedBox(width: 10),
                                  PriceAndCountItems(
                                    price: "${control.productDetails.first.price}",
                                  ),

                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,),
                            const SizedBox(height: 10),
                            Text(
                              "Product details: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.primaryColor),
                            ),

                            Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: control.sentenceWidgets,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Recommendation Products:",
                              style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                          ]),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            control
                                .getProductDeatails(control.similar[index].id!);
                          },
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${AppLink.apiImage}${control.similar[index].image!.first.photo!}",
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "${control.similar[index].price}\$",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${control.similar[index].name}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 13,
                          );
                        },
                        itemCount: controller.similar.length,
                      ),
                    )
                  ]),
          ),
        ));
  }
}
