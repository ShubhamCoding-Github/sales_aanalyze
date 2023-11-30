class ProfileApiResponse {
  bool? status;
  Data? data;

  ProfileApiResponse({this.status, this.data});

  ProfileApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? profile;
  Null emailVerifiedAt;
  String? pwd;
  int? status;
  int? isVerified;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.profile,
        this.emailVerifiedAt,
        this.pwd,
        this.status,
        this.isVerified,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profile = json['profile'];
    emailVerifiedAt = json['email_verified_at'];
    pwd = json['pwd'];
    status = json['status'];
    isVerified = json['is_verified'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profile'] = this.profile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['pwd'] = this.pwd;
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
