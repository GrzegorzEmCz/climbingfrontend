import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:climbingfrontend/constants/app_constants.dart';
import 'package:climbingfrontend/models/request/bookmarks/bookmarks_model.dart';
import 'package:climbingfrontend/models/response/bookmarks/all_bookmarks.dart';
import 'package:climbingfrontend/services/helpers/book_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkNotifier extends ChangeNotifier {
  List<String> _roads = [];
  Future<List<AllBookmark>>? bookmarks;

  List<String> get roads => _roads;

  set roads(List<String> newList) {
    _roads = newList;
    notifyListeners();
  }

  Future<void> addRoad(String roadId) async {
    final prefs = await SharedPreferences.getInstance();
    if (_roads != null) {
      _roads.insert(0, roadId);
      prefs.setStringList('roadId', _roads);
      notifyListeners();
    }
  }

  Future<void> removeRoad(String roadId) async {
    final prefs = await SharedPreferences.getInstance();
    if (_roads != null) {
      _roads.remove(roadId);
      prefs.setStringList('roadId', _roads);
      notifyListeners();
    }
  }

  Future<void> loadRoads() async {
    final prefs = await SharedPreferences.getInstance();
    final roads = prefs.getStringList('roadId');

    if (roads != null) {
      _roads = roads;
    }
  }

  addBookMark(BookmarkReqResModel model, String roadId) {
    BookMarkHelper.addBookmarks(model).then((response) {
      if (response[0]) {
        addRoad(roadId);
        Get.snackbar(
            "Bookmark successfully added", "Please Check your bookmarks",
            colorText: Color(kLight.value),
            backgroundColor: Color(kLightBlue.value),
            icon: const Icon(Icons.bookmark_add));
      } else if (!response[0]) {
        Get.snackbar("Failed to add Bookmarks", "Please try again",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_add));
      }
    });
  }

  deleteBookMark(String roadId) {
    BookMarkHelper.deleteBookmarks(roadId).then((response) {
      if (response) {
        removeRoad(roadId);
        Get.snackbar(
            "Bookmark successfully deleted", "Please check your bookmarks",
            colorText: Color(kLight.value),
            backgroundColor: Color(kOrange.value),
            icon: const Icon(Icons.bookmark_remove_outlined));
      } else if (!response) {
        Get.snackbar("Failed to delete Bookmarks", "Please try again",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_remove_outlined));
      }
    });
  }

  getBookMarks() {
   bookmarks = BookMarkHelper.getBookmarks();
  }
}
