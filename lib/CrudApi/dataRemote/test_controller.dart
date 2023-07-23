import 'package:get/get.dart';
import 'package:ok/CrudApi/StatusRequest.dart';
import 'package:ok/CrudApi/dataRemote/test_data.dart';
import 'package:ok/HomePage/model.dart';

import '../../Functions/handlingDataController.dart';

class TestController extends GetxController {
  late Homedata homedata; // Declare homedata as late to initialize it later
  List<Products> data = [];
  late StatusRequest statusRequest;

  // Use the Future<void> return type to indicate this is an asynchronous method
  Future<List<Products>?> getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response); // Call the function with the response
    if (StatusRequest.success == statusRequest) {
      List responseData=response["products"];
      data.addAll(responseData.map((e) => Products.fromJson(e)));
    }
       else {
        statusRequest = StatusRequest.failure;
      }
    update();
    }
  @override
  void onInit() {
    homedata = Homedata(Get.find()); // Initialize homedata here
    getData();
    super.onInit();
  }

}

