
import 'dart:convert';

PersonalInfoModel personalInfoModelFromJson(String str) => PersonalInfoModel.fromJson(json.decode(str));

String personalInfoModelToJson(PersonalInfoModel data) => json.encode(data.toJson());

class PersonalInfoModel {
  PersonalInfoModel({
    this.data,
  });

  Data? data;

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => PersonalInfoModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.country,
    this.email,
    this.phone,
    this.bio,
    this.profileImage,
    this.dOB,
    this.cover,

  });

  String? firstName;
  String? lastName;
  String? country;
  String? email;
  String? phone;
  String? bio;
  String? profileImage;
  String? dOB;
  String? cover;


  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    country: json["country"],
    email: json["email"],
    phone: json["phone"],
    bio: json["bio"],
    profileImage: json["profile-image"],
    dOB: json["d_o_b"],
    cover: json["cover"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "country": country,
    "email": email,
    "phone": phone,
    "bio": bio,
    "profile-image": profileImage,
    "d_o_b": dOB,
    "cover": cover,
  };
}

