import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/models/models.dart';
// import 'package:flutterlogin/utils/store.dart';

import 'package:flutterlogin/screens/index_screen.dart';
import 'package:flutterlogin/screens/login_screen.dart';
import 'package:flutterlogin/screens/home_screen.dart';
import 'package:flutterlogin/actions/startup_action.dart';

import 'package:flutterlogin/reducers/reducers.dart';

import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_persist/redux_persist.dart';

void main() async {
  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  final initialState = await persistor.load();

  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: initialState ?? AppState.initialState(),
    middleware: [persistor.createMiddleware()],
  );
  
  runApp(MyApp(store: store));
}

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
            },
          );
        },
      ),
    );
  }
}
