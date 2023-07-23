class ChildCategoryModel {
  int? id;
  String? name;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  ChildCategoryModel({this.id, this.name, this.categoryId, this.createdAt, this.updatedAt});

  ChildCategoryModel.fromJson(Map<String, dynamic> json) {
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