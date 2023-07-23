class AppLink {
  //old test server
  static const String server = "https://dummyjson.com/products/";

  //new server
  static const String newserver = "http://test.bareeqksa.com/public/api";

  //imagelink
  static const String apiImage =
      "https://test.bareeqksa.com/public/images/products/";

  //auth
  static const String signUp = "$newserver/register";
  static const String login = "$newserver/login";

  // home
  static const String category = "$newserver/category/parent";

  // subitems
  static const String childOfElectronics = "$newserver/category/parent/48";
  static const String childOfMen = "$newserver/category/parent/35";
  static const String childOfWomman = "$newserver/category/parent/38";

  //items
  static const String products = "$newserver/category/product/";

//CursorDataLink
  static const String cursorData = "$newserver/category/product/53";

  //BestSellerDataLink
  static const String BestSellerData = "$newserver/category/product/55";

  //productdeatails
  static const String productsdeatails = "$newserver/product/";

  //search
  static const String search = "$newserver/search/";

  //userdeatails
  static const String profile = "$newserver/user";

  // favourite
  static const String addToFavourite = "$newserver/add/favorite";
  static const String deleteFromFavourite =
      "$newserver/delete/favorite?_method=delete";
  static const String userFavourite = "$newserver/user/favorite";

  // avatar
  static const String avatar = "assets/images/avatar.png";
}
