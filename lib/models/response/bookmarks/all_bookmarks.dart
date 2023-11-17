import 'dart:convert';

List<AllBookmark> allBookmarkFromJson(String str) => List<AllBookmark>.from(json.decode(str).map((x) => AllBookmark.fromJson(x)));


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
        road: Road.fromJson(json["job"]),
        userId: json["userId"],
    );


}

class Road {
    final String id;
    final String title;
    final String location;
    final String company;
    final String salary;
    final String period;
    final String contract;
    final String imageUrl;
    final String agentId;

    Road({
        required this.id,
        required this.title,
        required this.location,
        required this.company,
        required this.salary,
        required this.period,
        required this.contract,
        required this.imageUrl,
        required this.agentId,
    });

    factory Road.fromJson(Map<String, dynamic> json) => Road(
        id: json["_id"],
        title: json["title"],
        location: json["location"],
        company: json["company"],
        salary: json["salary"],
        period: json["period"],
        contract: json["contract"],
        imageUrl: json["imageUrl"],
        agentId: json["agentId"],
    );

   
}
