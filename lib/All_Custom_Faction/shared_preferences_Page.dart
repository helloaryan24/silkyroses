import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/User_Models.dart';

  Future<bool> isLoggedIn() async {
    var pref = await SharedPreferences.getInstance();
    return pref.containsKey("currentUser");
  }

  Future<UserModel> getUser() async {
    var pref = await SharedPreferences.getInstance();
    var user = pref.getString("currentUser");
    return UserModel.fromJson(jsonDecode(user!));
  }

  Future<void> setUser(UserModel user) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString("currentUser", jsonEncode(user.toJson()));
  }

  Future<String> getToken() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString("token")!;
  }


