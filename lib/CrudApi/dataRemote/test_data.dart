
import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';

class Homedata{
  Crud crud;

  Homedata(this.crud);
  getData()async{
    var response =await crud.getData(AppLink.server);
    return response?.fold((l) => l, (r) => r);
  }
}