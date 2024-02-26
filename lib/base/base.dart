import 'package:flutter/material.dart';
import 'package:snackees/modules/authentication/login/login_screen.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        indicatorColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
