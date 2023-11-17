import 'package:flutter/material.dart';
import 'package:climbingfrontend/models/response/auth/profile_model.dart';
import 'package:climbingfrontend/services/helpers/auth_helper.dart';

class ProfileNotifier extends ChangeNotifier {
  Future<ProfileRes>? profile;
  getProfile() async {
    profile = AuthHelper.getProfile();
  }
}
