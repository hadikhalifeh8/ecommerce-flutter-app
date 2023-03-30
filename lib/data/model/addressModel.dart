class AddressModel {
  int? id;
  int? userId;
  String? addressName;
  String? city;
  String? street;
  double? adressLatitude;
  double? adressLongitude;
  String? createdAt;
  String? updatedAt;
  UserRltn? userRltn;

  AddressModel(
      {this.id,
      this.userId,
      this.addressName,
      this.city,
      this.street,
      this.adressLatitude,
      this.adressLongitude,
      this.createdAt,
      this.updatedAt,
      this.userRltn});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressName = json['address_name'];
    city = json['city'];
    street = json['street'];
    adressLatitude = json['adress_latitude'];
    adressLongitude = json['adress_longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userRltn = json['user_rltn'] != null
        ? new UserRltn.fromJson(json['user_rltn'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_name'] = this.addressName;
    data['city'] = this.city;
    data['street'] = this.street;
    data['adress_latitude'] = this.adressLatitude;
    data['adress_longitude'] = this.adressLongitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userRltn != null) {
      data['user_rltn'] = this.userRltn!.toJson();
    }
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