class ProductModel {
  int? id;
  String? name;
  int? price;
  String? discription;
  String? photo;
  int? categoryId;
  Null? createdAt;
  Null? updatedAt;
  List<Image>? image;

  ProductModel(
      {this.id,
        this.name,
        this.price,
        this.discription,
        this.photo,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discription = json['discription'];
    photo = json['photo'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discription'] = this.discription;
    data['photo'] = this.photo;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  int? id;
  String? photo;
  int? productId;
  String? createdAt;
  String? updatedAt;

  Image({this.id, this.photo, this.productId, this.createdAt, this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}