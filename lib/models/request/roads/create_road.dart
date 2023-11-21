import 'dart:convert';

String createRoadsRequestToJson(CreateRoadsRequest data) =>
    json.encode(data.toJson());

class CreateRoadsRequest {
  CreateRoadsRequest({
    required this.rock,
    required this.location,
    required this.name,
    required this.protected,
    required this.description,
    required this.grade,
    required this.season,
    required this.type,
    required this.imageUrl,
    required this.agentId,
    required this.requirements,
  });

  final String rock;
  final String location;
  final String name;
  final bool protected;
  final String description;
  final String grade;
  final String season;
  final String type;
  final String imageUrl;
  final String agentId;
  final List<String> requirements;

  Map<String, dynamic> toJson() => {
        "rock": rock,
        "location": location,
        "name": name,
        "protected": protected,
        "description": description,
        "grade": grade,
        "season": season,
        "type": type,
        "imageUrl": imageUrl,
        "agentId": agentId,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
      };
}
