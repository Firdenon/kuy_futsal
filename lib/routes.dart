import 'package:flutter/widgets.dart';
import 'package:kuy_futsal/screen/login_screen.dart';
import 'package:kuy_futsal/screen/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
