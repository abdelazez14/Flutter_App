import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';

class Itemsdata {
  Crud crud;

  Itemsdata(this.crud);

  Future getCursorData() async {
    var response = await crud.getData(AppLink.cursorData);
    return response?.fold((l) => l, (r) => r);
  }

  Future getBestSellerData() async {
    var response = await crud.getData(AppLink.BestSellerData);
    return response?.fold((l) => l, (r) => r);
  }

  getParentCategory() async {
    var response = await crud.getData(AppLink.category);
    return response?.fold((l) => l, (r) => r);
  }

  //in subItemsController
  getChildElectronicsCategory() async {
    var response = await crud.getData(AppLink.childOfElectronics);
    return response?.fold((l) => l, (r) => r);
  }

  getChildMenCategory() async {
    var response = await crud.getData(AppLink.childOfMen);
    return response?.fold((l) => l, (r) => r);
  }

  getChildWommanCategory() async {
    var response = await crud.getData(AppLink.childOfWomman);
    return response?.fold((l) => l, (r) => r);
  }

  //in itemsController
  getProduct(int itemsId) async {
    var response = await crud.getData("${AppLink.products}$itemsId");
    return response?.fold((l) => l, (r) => r);
  }

//in ProductDeatalsController
  getProductDeatails(int productId) async {
    var response = await crud.getData("${AppLink.productsdeatails}$productId");
    return response?.fold((l) => l, (r) => r);
  }

  search(String search) async {
    var response = await crud.getData("${AppLink.search}$search");
    return response?.fold((l) => l, (r) => r);
  }
}
