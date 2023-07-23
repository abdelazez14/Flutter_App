import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ok/HomePage/homeController.dart';
import 'package:ok/const/imageasset.dart';

import '../AppColors.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 30,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                controller.gotoSubItems(controller.parentcategory[index].id!);
              },
              child: ViewParentCategoryHome(
                picture: controller.svgPicture[index],
                name: controller.parentcategory[index].name!,
              ));
        },
        itemCount: controller.parentcategory.length-2,
      ),
    );
  }
}

class ViewParentCategory extends GetView<HomeControllerImp> {
  const ViewParentCategory({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: <Color>[AppColor.primaryColor, AppColor.secondColor])),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Image.asset(
                "${AppImageAsset.rootImage}/$image",
                height: 100,
                width: 200,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class ViewParentCategoryHome extends GetView<HomeControllerImp> {
  const ViewParentCategoryHome({
    super.key,
    required this.name,
    required this.picture,
  });
  final String name;
  final SvgPicture picture;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 225, 225, 225),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 249, 249, 249),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          child: picture,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}
