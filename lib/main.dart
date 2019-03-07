import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './model/model.dart';
import './redux/reducers.dart';
import './redux/actions.dart';

import 'package:flutterlogin/screens/IndexScreen.dart';
import 'package:flutterlogin/screens/LoginScreen.dart';
import 'package:flutterlogin/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [],
    );

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
