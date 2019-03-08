import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/redux/reducers/reducers.dart';
import 'package:flutterlogin/model/model.dart';
import 'package:flutterlogin/redux/store.dart';

import 'package:flutterlogin/screens/index_screen.dart';
import 'package:flutterlogin/screens/login_screen.dart';
import 'package:flutterlogin/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreBuilder<AppState>(
        builder: (BuildContext context, Store<AppState> store) {
          return MaterialApp(
            title: 'login',
            home: IndexScreen(),
            routes: {
              '/login': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
