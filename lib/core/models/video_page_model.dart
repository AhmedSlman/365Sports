import 'dart:convert';

VideoPageModel videoPageModelFromJson(String str) =>
    VideoPageModel.fromJson(json.decode(str));

String videoPageModelToJson(VideoPageModel data) => json.encode(data.toJson());

class VideoPageModel {
  VideoPageModel({
    this.data,
  });

  Data? data;

  factory VideoPageModel.fromJson(Map<String, dynamic> json) => VideoPageModel(
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
    this.clientImage,
    this.title,
    this.description,
    this.createdAt,
    this.views,
    this.votes,
    this.isVoteClient,
    this.isVoteGuest,
    this.tags,
    this.videos,
    this.comments,
  });

  int? id;
  String? name;
  String? clientImage;
  String? title;
  String? description;
  String? createdAt;
  int? views;
  int? votes;
  int? isVoteClient;
  bool? isVoteGuest;
  String? tags;
  String? videos;
  List<Comment>? comments;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        clientImage: json["client-image"],
        title: json["title"],
        description: json["description"],
        createdAt: json["created_at"],
        views: json["views"],
        votes: json["votes"],
        isVoteClient: json["is_vote_client"],
        isVoteGuest: json["is_vote_guest"],
        tags: json["tags"],
        videos: json["videos"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "client-image": clientImage,
        "title": title,
        "description": description,
        "created_at": createdAt,
        "views": views,
        "votes": votes,
        "is_vote_client": isVoteClient,
        "is_vote_guest": isVoteGuest,
        "tags": tags,
        "videos": videos,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.commentId,
    this.content,
    this.clientName,
    this.clientProfile,
    this.date,
    this.time,
  });

  int? commentId;
  String? content;
  String? clientName;
  String? clientProfile;
  String? date;
  String? time;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentId: json["comment_id"],
        content: json["content"],
        clientName: json["client_name"],
        clientProfile: json["client_profile"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "comment_id": commentId,
        "content": content,
        "client_name": clientName,
        "client_profile": clientProfile,
        "date": date,
        "time": time,
      };
}
