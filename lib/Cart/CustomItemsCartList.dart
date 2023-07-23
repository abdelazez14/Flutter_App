import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class CustomItemsCart extends StatelessWidget {
   CustomItemsCart({Key? key, required this.name, required this.price, this.count, required this.image,  this.onPressedincrement,  this.onPresseddecrement}) : super(key: key);
final String name;
final String price;
 String? count;
final String image;
  void Function()? onPressedincrement;
  void Function()? onPresseddecrement;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child:
        Container(
          child:
          Row(
            children: [
              Expanded(
                  flex:2,
                  child: CachedNetworkImage(imageUrl:
                    image,
                  height: 90,
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  flex: 3,
                  child: ListTile(
                    title:Text(name,
                        style: TextStyle(color: AppColor.black,fontSize: 15)),
                    subtitle: Text("$price\$",
                      style: TextStyle(color: AppColor.primaryColor,fontSize: 17),),
                  )),
            Expanded(
                  child:
              Column(
                children: [
                  Container(
                    height: 35,
                    child: IconButton(onPressed:onPressedincrement , icon: const Icon(Icons.add),),),
                  Container(
                    height: 30,
                    child:  Text(count!,style: const TextStyle(fontFamily: "sans"),),),
                  Container(
                    height: 25,
                    child: IconButton(onPressed: onPresseddecrement, icon: const Icon(Icons.remove),),),
                ],
              ),
              ),
            ],
          ) ,
        ),
      ),
    );
  }
}



