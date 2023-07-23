class Categoriesmodel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  Categoriesmodel({this.products, this.total, this.skip, this.limit});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
 
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
       
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
 
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
  
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}


class ParentCategoryModel {
  int? id;
  String? name;
  Null? categoryId;
  String? createdAt;
  String? updatedAt;

  ParentCategoryModel({this.id, this.name, this.categoryId, this.createdAt, this.updatedAt});

  ParentCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}