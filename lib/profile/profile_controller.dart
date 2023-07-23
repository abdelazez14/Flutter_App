import 'package:get/get.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/Functions/handlingDataController.dart';
import 'package:ok/Services/Services.dart';
import 'package:ok/profile/profile_data.dart';
 
class ProfileController extends GetxController{
StatusRequest statusRequest = StatusRequest.none;
ProfileData profileData =ProfileData(Get.find());
MyServices myServices =Get.find();
Map profile ={};

Future getProfile()async{
    statusRequest=StatusRequest.loading;
    update();
     var response=await profileData.getprofileData(myServices.sharedPreferences.getString("token")!);
    statusRequest=handlingData(response);
     if(StatusRequest.success == statusRequest) {
      profile.addAll(response["data"]) ;
      print(profile);
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  
  }



@override
  void onInit() {
    getProfile();
    super.onInit();
  }







}