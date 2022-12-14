class ItemsModel {
  int? id;
  int? categoryId;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  int? count;
  int? active;
  int? price;
  int? discount;
  String? createdAt;
  String? updatedAt;

  ItemsModel(
      {this.id,
      this.categoryId,
      this.nameAr,
      this.nameEn,
      this.descriptionAr,
      this.descriptionEn,
      this.image,
      this.count,
      this.active,
      this.price,
      this.discount,
      this.createdAt,
      this.updatedAt});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    image = json['image'];
    count = json['count'];
    active = json['active'];
    price = json['price'];
    discount = json['discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['image'] = this.image;
    data['count'] = this.count;
    data['active'] = this.active;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}