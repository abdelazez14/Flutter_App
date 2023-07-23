class ProductDeatails {
  List<ProductDeatailsModel>? productDeatailsModel;
  List<Similar>? similar;

  ProductDeatails({this.productDeatailsModel, this.similar});

  ProductDeatails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productDeatailsModel = <ProductDeatailsModel>[];
      json['data'].forEach((v) {
        productDeatailsModel!.add(new ProductDeatailsModel.fromJson(v));
      });
    }
    if (json['similar'] != null) {
      similar = <Similar>[];
      json['similar'].forEach((v) {
        similar!.add(new Similar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productDeatailsModel != null) {
      data['data'] = this.productDeatailsModel!.map((v) => v.toJson()).toList();
    }
    if (this.similar != null) {
      data['similar'] = this.similar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDeatailsModel {
  int? id;
  String? name;
  int? price;
  String? discription;
  String? photo;
  int? categoryId;
  Null? createdAt;
  Null? updatedAt;
  List<Attributes>? attributes;
  List<Image>? image;

  ProductDeatailsModel(
      {this.id,
      this.name,
      this.price,
      this.discription,
      this.photo,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.attributes,
      this.image});

  ProductDeatailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discription = json['discription'];
    photo = json['photo'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
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
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? value;
  Pivot? pivot;

  Attributes({this.name, this.value, this.pivot});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? productId;
  int? attributeId;
  String? value;

  Pivot({this.productId, this.attributeId, this.value});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    attributeId = json['attribute_id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['attribute_id'] = this.attributeId;
    data['value'] = this.value;
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

class Similar {
  int? id;
  String? name;
  int? price;
  String? discription;
  String? photo;
  int? categoryId;
  Null? createdAt;
  Null? updatedAt;
  List<Image>? image;

  Similar(
      {this.id,
      this.name,
      this.price,
      this.discription,
      this.photo,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.image});

  Similar.fromJson(Map<String, dynamic> json) {
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