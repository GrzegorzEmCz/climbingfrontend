import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:climbingfrontend/models/request/chat/create_chat.dart';
import 'package:climbingfrontend/models/response/chat/get_chat.dart';
import 'package:climbingfrontend/models/response/chat/initial_msg.dart';
import 'package:climbingfrontend/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHelper {
  static var client = https.Client();

  static Future<List<dynamic>> apply(CreateChat model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, Config.chatsUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      var first = initialChatFromJson(response.body).id;

      return [true, first];
    } else {
      return [false];
    }
  }

  static Future<List<GetChats>> getConversations() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, Config.chatsUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var chats = getChatsFromJson(response.body);

      return chats;
    } else {
      throw Exception("Couldn't load chats");
    }
  }
}
