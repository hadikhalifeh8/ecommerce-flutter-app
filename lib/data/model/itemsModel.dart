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
  int? itemspricediscount;
  int? favorite;
  String? createdAt;
  String? updatedAt;
  CategoryRltn? categoryRltn;

  ItemsModel(categoryid, 
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
      this.itemspricediscount,
      this.favorite,
      this.createdAt,
      this.updatedAt,
      this.categoryRltn});

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
    itemspricediscount = json['itemspricediscount'];
    favorite = json['favorite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryRltn = json['category_rltn'] != null
        ? new CategoryRltn.fromJson(json['category_rltn'])
        : null;
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
    data['itemspricediscount'] = this.itemspricediscount;
    data['favorite'] = this.favorite;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categoryRltn != null) {
      data['category_rltn'] = this.categoryRltn!.toJson();
    }
    return data;
  }
}

class CategoryRltn {
  int? id;
  String? nameAr;
  String? nameEn;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryRltn(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoryRltn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}




































































// class ItemsModel {
//   int? id;
//   int? categoryId;
//   String? nameAr;
//   String? nameEn;
//   String? descriptionAr;
//   String? descriptionEn;
//   String? image;
//   int? count;
//   int? active;
//   int? price;
//   int? discount;
//   String? createdAt;
//   String? updatedAt;

//   ItemsModel(
//       {this.id,
//       this.categoryId,
//       this.nameAr,
//       this.nameEn,
//       this.descriptionAr,
//       this.descriptionEn,
//       this.image,
//       this.count,
//       this.active,
//       this.price,
//       this.discount,
//       this.createdAt,
//       this.updatedAt});

//   ItemsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     nameAr = json['name_ar'];
//     nameEn = json['name_en'];
//     descriptionAr = json['description_ar'];
//     descriptionEn = json['description_en'];
//     image = json['image'];
//     count = json['count'];
//     active = json['active'];
//     price = json['price'];
//     discount = json['discount'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['name_ar'] = this.nameAr;
//     data['name_en'] = this.nameEn;
//     data['description_ar'] = this.descriptionAr;
//     data['description_en'] = this.descriptionEn;
//     data['image'] = this.image;
//     data['count'] = this.count;
//     data['active'] = this.active;
//     data['price'] = this.price;
//     data['discount'] = this.discount;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }


