import 'package:flutterlogin/models/device_model.dart';
import 'package:flutterlogin/models/user_model.dart';
import 'package:flutterlogin/models/todo_model.dart';
import 'package:flutterlogin/models/quote_model.dart';

class AppState {
  final Device devices;
  final User users;
  final ToDo todos;
  final Quote quotes;

  AppState({this.devices, this.users, this.todos, this.quotes});

  AppState.initialState()
      : devices = Device(),
        users = User(),
        todos = ToDo(todo: []),
        quotes = Quote(author: '', authorQuote: '');

  static AppState fromJson(dynamic json) {
    print(json);
    if (json != null) {
      return AppState(
        devices: Device.fromJson(json['devices']),
        todos: ToDo.fromJson(json['todos']),
        quotes: Quote.fromJson(json['quotes']),
      );
    } else {
      return AppState.initialState();
    }
  }

  dynamic toJson() => {
    'devices': devices,
    'users': users,
    'todos': todos,
    'quotes': quotes,
  };

}
