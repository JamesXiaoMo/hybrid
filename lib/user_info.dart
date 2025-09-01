import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  bool isLogin = false;
  String username = "";
  String password = "";
  int userID = 0;

  void login(String username, String password, int userID) {
    isLogin = true;
    this.username = username;
    this.password = password;
    this.userID = userID;
    notifyListeners();
  }

  void logout() {
    isLogin = false;
    username = "";
    password = "";
    userID = 0;
    notifyListeners();
  }
}
