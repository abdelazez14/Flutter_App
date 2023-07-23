import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';

class ProfileData{

Crud crud;
ProfileData(this.crud);

getprofileData(String token)async{
var response = await crud.getData(AppLink.profile,headers: {
  "Authorization":"Bearer $token" });


return response?.fold((l) => l, (r) => r);
}

}