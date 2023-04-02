class CouponModel {
  int? id;
  String? name;
  int? count;
  int? discount;
  String? expiryDate;
  Null? createdAt;
  Null? updatedAt;

  CouponModel(
      {this.id,
      this.name,
      this.count,
      this.discount,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    discount = json['discount'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['count'] = this.count;
    data['discount'] = this.discount;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}