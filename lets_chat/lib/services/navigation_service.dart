import 'package:flutter/material.dart';
import 'package:lets_chat/pages/forgot_password.dart';
import 'package:lets_chat/pages/home_page.dart';
import 'package:lets_chat/pages/login_page.dart';
import 'package:lets_chat/pages/register_page.dart';

class NavigationService {
  late GlobalKey<NavigatorState> _navigatorKey;

  final Map<String, Widget Function(BuildContext)> _routes = {
    "/login": (context) => LoginPage(),
    "/home": (context) => HomePage(),
    "/forgotPassword": (context) => ForgotPassword(),
    "/register": (context) => RegisterPage(),
    // "/chat": (context) => ChatPage(userProfile: ), 
    //here we have to push to the user profile with the user profile because of that used the push function below.
  };

  GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)> get routes {
    return _routes;
  }

  NavigationService() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }
  void push(MaterialPageRoute route) {
    _navigatorKey.currentState!.push(route);
  }

  void pushNamed(String routeName) {
    _navigatorKey.currentState!.pushNamed(routeName);
  }

  void pushReplacementNamed(String routeName) {
    _navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void goBack() {
    _navigatorKey.currentState!.pop();
  }
}
