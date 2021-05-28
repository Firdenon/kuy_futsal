import 'package:flutter/material.dart';
import 'package:kuy_futsal/routes.dart';
import 'package:kuy_futsal/screen/login_screen.dart';
import 'package:kuy_futsal/theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futsal Kuy',
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
