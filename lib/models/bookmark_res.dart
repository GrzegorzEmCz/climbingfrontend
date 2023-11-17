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
    required this.title,
    required this.imageUrl,
    required this.company,
    required this.location,
  });

  final String id;
  final String road;
  final String userId;
  final String title;
  final String imageUrl;
  final String company;
  final String location;

  factory BookmarkResModel.fromJson(Map<String, dynamic> json) =>
      BookmarkResModel(
        id: json["_id"],
        road: json["road"],
        userId: json["userId"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        company: json["company"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "road": road,
        "userId": userId,
        "title": title,
        "imageUrl": imageUrl,
        "company": company,
        "location": location,
      };
}
