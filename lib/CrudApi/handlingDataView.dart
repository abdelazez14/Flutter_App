import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/const/imageasset.dart';

class handlingDataView extends StatelessWidget {
  const handlingDataView({Key? key, required this.statusRequest, required this.widget}) : super(key: key);
final StatusRequest statusRequest;
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return
        statusRequest==StatusRequest.loading?
         Center(
          child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250),
        ) :
        statusRequest==StatusRequest.offlinefailure ?
         Center(
          child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),
        ) :
        statusRequest==StatusRequest.serverfailure?
         Center(
          child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),
        ) :
        statusRequest==StatusRequest.failure ?
        Center(
          child: Lottie.asset(AppImageAsset.noData,width: 250,height: 250),
        ) : widget;
  }
}
