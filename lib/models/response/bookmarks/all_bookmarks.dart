import 'dart:convert';

List<AllBookmark> allBookmarkFromJson(String str) => List<AllBookmark>.from(
    json.decode(str).map((x) => AllBookmark.fromJson(x)));

class AllBookmark {
  final String id;
  final Road road;
  final String userId;

  AllBookmark({
    required this.id,
    required this.road,
    required this.userId,
  });

  factory AllBookmark.fromJson(Map<String, dynamic> json) => AllBookmark(
        id: json["_id"],
        road: Road.fromJson(json["road"]),
        userId: json["userId"],
      );
}

class Road {
  final String id;
  final String rock;
  final String location;
  final String name;
  final String grade;
  final String season;
  final String type;
  final String imageUrl;
  final String agentId;

  Road({
    required this.id,
    required this.rock,
    required this.location,
    required this.name,
    required this.grade,
    required this.season,
    required this.type,
    required this.imageUrl,
    required this.agentId,
  });

  factory Road.fromJson(Map<String, dynamic> json) => Road(
        id: json["_id"],
        rock: json["rock"],
        location: json["location"],
        name: json["name"],
        grade: json["grade"],
        season: json["season"],
        type: json["type"],
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
      );
}
