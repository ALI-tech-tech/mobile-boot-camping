import 'package:blogappwithrealapi/core/model/user.dart';
import 'package:blogappwithrealapi/helpers/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/urls.dart';

class UserViewModel with ChangeNotifier {
  APIdp api = APIdp();
  late SharedPreferences prefs;

  UserViewModel() {
    getShared();
  }
  Future<bool> rgister(User u) async {
    Map<String, dynamic> result =
        (await api.sendApi(u.toJson(), AppURL.REGISTER))['result'];
    if (result['code'] == 1200) {
      String token=result['data']['token'];
      await prefs.setString('token', token);
      print('Token saved: $token');
      return true;
    }else{
      print('Token not save saved');
      print(result['message']);
      return false;
    }
  }

  login() {}

  logout() {}

  getShared() async {
    prefs = await SharedPreferences.getInstance();
  }
  getToken() async {
    return await prefs.getString('token');
  }
}
