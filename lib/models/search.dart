import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
    json.decode(str).map((x) => SearchModel.fromJson(x)));

class SearchModel {
  SearchModel({
    required this.id,
    required this.rock,
    required this.location,
    required this.name,
    required this.protected,
    required this.grade,
    required this.season,
    required this.type,
    required this.imageUrl,
  });

  final String id;
  final String rock;
  final String location;
  final String name;
  final bool protected;
  final String grade;
  final String season;
  final String type;
  final String imageUrl;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["_id"],
        rock: json["rock"],
        location: json["location"],
        name: json["name"],
        protected: json["protected"],
        grade: json["grade"],
        season: json["season"],
        type: json["type"],
        imageUrl: json["imageUrl"],
      );
}
