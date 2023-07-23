import 'package:get/get.dart';
import 'package:ok/CrudApi/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}