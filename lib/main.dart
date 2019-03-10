import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutterlogin/models/models.dart';
import 'package:flutterlogin/reducers/reducers.dart';

import 'package:flutterlogin/app.dart';

void main() async {
  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  final initialState = await persistor.load();

  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: initialState ?? AppState.initialState(),
    middleware: [persistor.createMiddleware(), thunkMiddleware],
  );
  
  runApp(MyApp(store: store));
}