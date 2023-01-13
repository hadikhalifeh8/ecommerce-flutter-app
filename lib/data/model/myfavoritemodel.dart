class MyFavoriteModel {
  int? id;
  int? usersId;
  int? itemsId;
  String? createdAt;
  String? updatedAt;
  ItemRltn? itemRltn;
  UserRltn? userRltn;

  MyFavoriteModel(
      {this.id,
      this.usersId,
      this.itemsId,
      this.createdAt,
      this.updatedAt,
      this.itemRltn,
      this.userRltn});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    itemsId = json['items_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemRltn = json['item_rltn'] != null
        ? new ItemRltn.fromJson(json['item_rltn'])
        : null;
    userRltn = json['user_rltn'] != null
        ? new UserRltn.fromJson(json['user_rltn'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['users_id'] = this.usersId;
    data['items_id'] = this.itemsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itemRltn != null) {
      data['item_rltn'] = this.itemRltn!.toJson();
    }
    if (this.userRltn != null) {
      data['user_rltn'] = this.userRltn!.toJson();
    }
    return data;
  }
}

class ItemRltn {
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
  int? favorite;
  String? createdAt;
  String? updatedAt;

  ItemRltn(
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
      this.favorite,
      this.createdAt,
      this.updatedAt});

  ItemRltn.fromJson(Map<String, dynamic> json) {
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
    favorite = json['favorite'];
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
    data['favorite'] = this.favorite;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserRltn {
  int? id;
  String? name;
  String? email;
  String? phoneNo;
  int? verifyCode;
  String? userApprove;
  Null? emailVerifiedAt;
  Null? twoFactorSecret;
  Null? twoFactorRecoveryCodes;
  Null? twoFactorConfirmedAt;
  String? createdAt;
  String? updatedAt;

  UserRltn(
      {this.id,
      this.name,
      this.email,
      this.phoneNo,
      this.verifyCode,
      this.userApprove,
      this.emailVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.twoFactorConfirmedAt,
      this.createdAt,
      this.updatedAt});

  UserRltn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    verifyCode = json['verify_code'];
    userApprove = json['user_approve'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['verify_code'] = this.verifyCode;
    data['user_approve'] = this.userApprove;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}