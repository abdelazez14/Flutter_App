import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';

class FavouriteData {
Crud crud ;
FavouriteData(this.crud);

addToFavourite(String token,String id)async{
var response =await crud.postData(AppLink.addToFavourite, {
    "product_id":id,
}, {
  "Authorization":"Bearer $token"
});
return response.fold((l) => l, (r) => r);
}


deleteFromFavourite(String token,String id)async{
var response =await crud.postData(AppLink.deleteFromFavourite, {
  "product_id":id,
}, {
  "Authorization":"Bearer $token"
});

return response.fold((l) => l, (r) => r);
}


userFavourite(String token)async{
var response =await crud.getData(AppLink.userFavourite,
headers: {
 "Authorization":"Bearer $token"
});

return response?.fold((l) => l, (r) => r);
}


}