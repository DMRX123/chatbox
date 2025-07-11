import 'package:flutter/material.dart';
import 'package:chatbox/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;
  String? _currentZone;

  UserModel? get currentUser => _currentUser;
  String? get currentZone => _currentZone;

  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  void setZone(String zone) {
    _currentZone = zone;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
    _currentZone = null;
    notifyListeners();
  }
}