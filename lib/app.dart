import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/models/models.dart';

import 'package:flutterlogin/screens/index_screen.dart';
import 'package:flutterlogin/screens/login_screen.dart';
import 'package:flutterlogin/screens/home_screen.dart';
import 'package:flutterlogin/screens/quote_screen.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreBuilder<AppState>(
        builder: (BuildContext context, Store<AppState> store) {
          return MaterialApp(
            title: 'login',
            home: IndexScreen(store: store),
            routes: {
              '/login': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/quote': (context) => QuoteScreen(),
            },
          );
        },
      ),
    );
  }
}
