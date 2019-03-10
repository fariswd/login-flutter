import 'package:flutterlogin/models/models.dart';

import 'package:flutterlogin/reducers/device_reducer.dart';
import 'package:flutterlogin/reducers/user_reducer.dart';
import 'package:flutterlogin/reducers/todo_reducer.dart';
import 'package:flutterlogin/reducers/quote_reducer.dart';


AppState appStateReducer(AppState state, action) {
  return AppState(
    devices: deviceReducer(state.devices, action),
    users: userReducer(state.users, action),
    todos: todoReducer(state.todos, action),
    quotes:quoteReducer(state.quotes, action),
  );
}