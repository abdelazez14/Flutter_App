import '../CrudApi/crud.dart';
import '../LinkApi.dart';

class SigninData {
  Crud crud;
  SigninData(this.crud);
  postData( String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    },
    {
      "Accept":"application/json",
    }
    );
    return response.fold((l) => l, (r) => r);
  }
}
