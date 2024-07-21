// To parse this JSON data, do
//
//     final profileByIdModel = profileByIdModelFromJson(jsonString);

import 'dart:convert';

ProfileByIdModel profileByIdModelFromJson(String str) => ProfileByIdModel.fromJson(json.decode(str));

String profileByIdModelToJson(ProfileByIdModel data) => json.encode(data.toJson());

class ProfileByIdModel {
  ProfileByIdModel({
    this.data,
  });

  Data? data;

  factory ProfileByIdModel.fromJson(Map<String, dynamic> json) => ProfileByIdModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.bio,
    this.votes,
    this.views,
    this.profileImage,
    this.cover,
    this.videos,
  });

  int? id;
  String? name;
  String? bio;
  int? votes;
  int? views;
  String? profileImage;
  dynamic cover;
  List<Videos>? videos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    bio: json["bio"],
    votes: json["votes"],
    views: json["views"],
    profileImage: json["profile-image"],
    cover: json["cover"],
    videos: List<Videos>.from(json["videos"].map((x) => Videos.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "bio": bio,
    "votes": votes,
    "views": views,
    "profile-image": profileImage,
    "cover": cover,
    "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class Videos {
  Videos({
    this.id,
    this.name,
    this.clientImage,
    this.title,
    this.createdAt,
    this.views,
    this.videos,
  });

  int? id;
  String? name;
  String? clientImage;
  String? title;
  String? createdAt;
  int? views;
  String? videos;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    id: json["id"],
    name: json["name"],
    clientImage: json["client-image"],
    title: json["title"],
    createdAt: json["created_at"],
    views: json["views"],
    videos: json["videos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "client-image": clientImage,
    "title": title,
    "created_at": createdAt,
    "views": views,
    "videos": videos,
  };
}
