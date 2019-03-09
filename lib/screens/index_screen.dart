import 'package:flutter/material.dart';

// import 'package:flutterlogin/utils/store.dart';
import 'package:flutterlogin/models/models.dart';

import 'package:redux/redux.dart';

import 'package:flutterlogin/screens/home_screen.dart';
import 'package:flutterlogin/screens/login_screen.dart';

class IndexScreen extends StatelessWidget {
  final Store<AppState> store;
  IndexScreen({this.store});

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
