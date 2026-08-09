import 'package:flutter/material.dart';

class SubscriptionProvider with ChangeNotifier {
  bool _isSubscribed = false;
  bool _isLoading = false;

  bool get isSubscribed => _isSubscribed;
  bool get isLoading => _isLoading;

  Future<void> checkSubscriptionStatus() async {
    _isLoading = true;
    notifyListeners();

    // فحص حالة الاشتراك
    await Future.delayed(const Duration(milliseconds: 500));
    _isSubscribed = true;

    _isLoading = false;
    notifyListeners();
  }
}
