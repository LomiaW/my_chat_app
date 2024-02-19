import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static late final SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(String username) async {
    try {
      _prefs.setString('username', username);
    } catch (e) {
      throw Exception(e);
    }
  }

  void logoutUser() async {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString('username') ?? 'DefaultValue';
  }
  
  void updateUserName(String newName) {
    _prefs.setString('username', newName);
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    String? username = _prefs.getString('username');
    return username != null;
  }
}