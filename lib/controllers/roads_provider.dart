import 'package:flutter/foundation.dart';
import 'package:climbingfrontend/models/response/roads/get_road.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/services/helpers/roads_helper.dart';

class RoadsNotifier extends ChangeNotifier {
  late Future<List<RoadsResponse>> roadList;
  late Future<RoadsResponse> recent;
  late Future<GetRoadRes> road;

  getRoads() {
    roadList = RoadsHelper.getRoads();
  }

  getRecent() {
    recent = RoadsHelper.getRecent();
  }

  getRoad(String roadId) {
    road = RoadsHelper.getRoad(roadId);
  }
}