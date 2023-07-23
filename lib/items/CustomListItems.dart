import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/ItemsController.dart';
import 'package:ok/items/ModelProduct.dart';
 import '../AppColors.dart';
 
class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems( {Key? key,required this.productModel,required this.active,required this.onTap,this.onIconPressed,this.type}) : super(key: key);
 final  ProductModel productModel;
 final bool active;
 final String? type;
 final void Function() onTap;
 final void Function()? onIconPressed;
  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap:onTap,
          child: SingleChildScrollView(
            physics:  const NeverScrollableScrollPhysics(),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(imageUrl:productModel.categoryId==25||productModel.categoryId==30?
                    "${AppLink.apiImage}${productModel.photo}":
                    "${AppLink.apiImage}${productModel.image!.first.photo}",height: 145,width: 200,),
                     const SizedBox(height: 25,),
                      Text(productModel.name!,style: const TextStyle(color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                     ),
                  
                   // const SizedBox(height: 2,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("${productModel.price}\$",style: const TextStyle(color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,fontFamily: "sans"),),
                         IconButton(
                          onPressed:onIconPressed,
                            icon:Icon(
                          
                              active==true&&type=="items"?
                              Icons.favorite:active==false&&type=="items"?Icons.favorite_border_outlined:type=="fav"?Icons.delete_forever_outlined:null,
                                
                              color: AppColor.primaryColor,) )
                    ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
