import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navProvider =
    ChangeNotifierProvider<NavController>((ref) => NavController());

class NavController extends ChangeNotifier {
  int bottomNavIndex = 0;
  updateNav(int i) {
    bottomNavIndex = i;
    notifyListeners();
  }
}
