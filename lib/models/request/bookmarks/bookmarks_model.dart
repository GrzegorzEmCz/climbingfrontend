import 'dart:convert';

BookmarkReqResModel bookmarkReqResModelFromJson(String str) =>
    BookmarkReqResModel.fromJson(json.decode(str));

String bookmarkReqResModelToJson(BookmarkReqResModel data) =>
    json.encode(data.toJson());

class BookmarkReqResModel {
  final String road;

  BookmarkReqResModel({
    required this.road,
  });

  factory BookmarkReqResModel.fromJson(Map<String, dynamic> json) =>
      BookmarkReqResModel(
        road: json["road"],
      );

  Map<String, dynamic> toJson() => {
        "road": road,
      };
}
