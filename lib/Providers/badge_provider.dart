import 'package:flutter/material.dart';

class BadgeProvider with ChangeNotifier {
  final List<String> _earnedBadges = [];

  List<String> get earnedBadges => _earnedBadges;

  void addBadge(String badgeId) {
    if (!_earnedBadges.contains(badgeId)) {
      _earnedBadges.add(badgeId);
      notifyListeners();
    }
  }

  void clearBadges() {
    _earnedBadges.clear();
    notifyListeners();
  }
}