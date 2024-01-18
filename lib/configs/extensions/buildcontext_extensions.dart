import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  void pushScreenTo(Widget page) =>
      Navigator.push(this, MaterialPageRoute(builder: (c) => page));
  void popFromScreen() => Navigator.pop(this);
  // ignore: non_constant_identifier_names
  void PushReplacementScreenTo(Widget page) =>
      Navigator.pushReplacement(this, MaterialPageRoute(builder: (c) => page));
}
