import 'dart:convert';

GetRoadRes getRoadResFromJson(String str) =>
    GetRoadRes.fromJson(json.decode(str));

String getRoadResToJson(GetRoadRes data) => json.encode(data.toJson());

class GetRoadRes {
  GetRoadRes({
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
  final DateTime updatedAt;

  factory GetRoadRes.fromJson(Map<String, dynamic> json) => GetRoadRes(
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
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rock": rock,
        "location": location,
        "name": name,
        "protected": protected,
        "description": description,
        "grade": grade,
        "season": season,
        "type": type,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "imageUrl": imageUrl,
        "agentId": agentId,
        "updatedAt": updatedAt.toIso8601String(),
      };
}
