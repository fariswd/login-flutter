import 'package:flutter/material.dart';

import 'package:flutterlogin/utils/store.dart';

import 'package:flutterlogin/screens/home_screen.dart';
import 'package:flutterlogin/screens/login_screen.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var status = store.state.devices.isLogin;
    if(status) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }

}
