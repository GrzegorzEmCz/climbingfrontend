import 'package:http/http.dart' as https;
import 'package:climbingfrontend/models/response/roads/get_road.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/services/config.dart';

class RoadsHelper {
  static var client = https.Client();

  static Future<List<RoadsResponse>> getRoads() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.roads);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var roadsList = roadsResponseFromJson(response.body);
      return roadsList;
    } else {
      throw Exception("Failed to get the roads");
    }
  }

// get road
  static Future<GetRoadRes> getRoad(String roadId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.roads}/$roadId");
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var road = getRoadResFromJson(response.body);
      return road;
    } else {
      throw Exception("Failed to get a road");
    }
  }

  static Future<RoadsResponse> getRecent() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.roads);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var roadsList = roadsResponseFromJson(response.body);

      var recent = roadsList.first;
      return recent;
    } else {
      throw Exception("Failed to get the roads");
    }
  }


//SEARCH 
 static Future<List<RoadsResponse>> searchRoads(String searchQeury) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.search}/$searchQeury");
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var roadsList = roadsResponseFromJson(response.body);
      return roadsList;
    } else {
      throw Exception("Failed to get the roads");
    }
  }
}
