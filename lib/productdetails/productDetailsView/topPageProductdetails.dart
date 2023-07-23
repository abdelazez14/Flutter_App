import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/LinkApi.dart';

import '../../AppColors.dart';
import '../productdetails_controller.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,

            right: Get.width /12,
            left: Get.width /12,

            child: Hero(
              tag: ("${controller.productDetails[0].id}"),

                child: CarouselSlider.builder(
                  itemCount: controller.productDetails.first.image!.length,
                  options: CarouselOptions(height: 280,viewportFraction: 1, autoPlay: true),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                    width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: CachedNetworkImage(
                        imageUrl:
                            ("${AppLink.apiImage}${controller.productDetails.first.image![index].photo!}"),
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            )
      ],
    );
  }
}
