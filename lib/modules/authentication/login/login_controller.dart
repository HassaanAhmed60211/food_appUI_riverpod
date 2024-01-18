import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    ChangeNotifierProvider<LoginProvider>((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  String isSwitch = 'login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  void selectSwitch(String val) {
    isSwitch = val;
    notifyListeners();
  }
}
