import 'dart:convert';

List<RoadsResponse> roadsResponseFromJson(String str) =>
    List<RoadsResponse>.from(
        json.decode(str).map((x) => RoadsResponse.fromJson(x)));

class RoadsResponse {
  RoadsResponse({
    required this.id,
    required this.rock,
    required this.location,
    required this.name,
    required this.protected,
    required this.description,
    required this.grade,
    required this.season,
    required this.type,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String rock;
  final String location;
  final String name;
  final bool protected;
  final String description;
  final String grade;
  final String season;
  final String type;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory RoadsResponse.fromJson(Map<String, dynamic> json) => RoadsResponse(
        id: json["_id"],
        rock: json["rock"],
        location: json["location"],
        name: json["name"],
        protected: json["protected"],
        description: json["description"],
        grade: json["grade"],
        season: json["season"],
        type: json["type"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
