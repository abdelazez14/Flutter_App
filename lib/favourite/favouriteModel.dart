class Pivot {
  int? userId;
  int? productId;

  Pivot({this.userId, this.productId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    return data;
  }
}

