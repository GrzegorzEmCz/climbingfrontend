import 'dart:convert';

List<BookmarkResModel> bookmarkResModelFromJson(String str) =>
    List<BookmarkResModel>.from(
        json.decode(str).map((x) => BookmarkResModel.fromJson(x)));

String bookmarkResModelToJson(List<BookmarkResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookmarkResModel {
  BookmarkResModel({
    required this.id,
    required this.road,
    required this.userId,
    required this.rock,
    required this.imageUrl,
    required this.name,
    required this.location,
  });

  final String id;
  final String road;
  final String userId;
  final String rock;
  final String imageUrl;
  final String name;
  final String location;

  factory BookmarkResModel.fromJson(Map<String, dynamic> json) =>
      BookmarkResModel(
        id: json["_id"],
        road: json["road"],
        userId: json["userId"],
        rock: json["rock"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "road": road,
        "userId": userId,
        "rock": rock,
        "imageUrl": imageUrl,
        "name": name,
        "location": location,
      };
}
