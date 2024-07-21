
import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.data,
  });

  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
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
    required this.videos,
  });

  int? id;
  String? name;
  String? bio;
  int? votes;
  int? views;
  String? profileImage;
  String? cover;
  List<Video> videos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    bio: json["bio"],
    votes: json["votes"],
    views: json["views"],
    profileImage: json["profile-image"],
    cover: json["cover"],
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "bio": bio,
    "votes": votes,
    "views": views,
    "profile-image": profileImage,
    "cover": cover,
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
  };
}

class Video {
  Video({
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

  factory Video.fromJson(Map<String, dynamic> json) => Video(
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
