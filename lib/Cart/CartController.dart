
import 'package:get/get.dart';
import 'package:ok/routes.dart';
 import 'CartItems.dart';
 import 'package:flutter/material.dart';
enum Opretion { incremnt, decrement }

class CartController extends GetxController{


  Map<CartItem,dynamic> cartmap={};
  Set id={};
   addToCart(CartItem cartItem,int iD){
     if(cartmap.containsKey(cartItem))
        {
          cartmap[cartItem]+=1;
          } else 
          {
          
          cartmap.removeWhere((key,value)=>key.id==iD);
              cartmap[cartItem]=1;
          }
         update();
   }

get cart => cartmap;

void changeCount(int index,Opretion newCount){
  if(newCount==Opretion.incremnt){
    cartmap.addAll({cartmap.keys.toList()[index]:cartmap.values.toList()[index]+=1});
  }else if(newCount==Opretion.decrement){
    if( cartmap.values.toList()[index]==1){
      cartmap.remove(cartmap.keys.toList()[index]);
    }else{
      cartmap.addAll({cartmap.keys.toList()[index]:cartmap.values.toList()[index]-=1});
    }
  }
  update();
}


get totalprice =>cartmap.entries.map((cart) => cart.key.price*cart.value).toList();
get  total => cartmap.entries.map((cart) => cart.key.price*cart.value).toList().reduce((value,element) => value+element).toStringAsFixed(2);

gotoCheckOut(){
  Get.toNamed(AppRoutes.CheckOut,arguments: {"total":total});
}



   @override
  void onInit() {
     super.onInit();
  }
}

