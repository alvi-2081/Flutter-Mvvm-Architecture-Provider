import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.data!.tokens.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(token: token.toString());
  }
}
