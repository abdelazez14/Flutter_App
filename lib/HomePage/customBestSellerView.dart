import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/ModelProduct.dart';

class CustomBestSellerView extends StatelessWidget {
  const CustomBestSellerView({Key? key, required this.productModel}) : super(key: key);
 final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
         children: [
          CachedNetworkImage(
            imageUrl:"${AppLink.apiImage}${productModel.image!.first.photo}",
            height: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${productModel.price}\$",
            style:const  TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            width: 150,
            child: Text(
              "${productModel.name}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11),
            ),
          ),
        ]
    );
  }
}
