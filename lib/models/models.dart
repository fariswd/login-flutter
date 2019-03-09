import 'package:flutterlogin/models/device_model.dart';
import 'package:flutterlogin/models/user_model.dart';
import 'package:flutterlogin/models/todo_model.dart';

class AppState {
  final Device devices;
  final User users;
  final ToDo todos;

  AppState({this.devices, this.users, this.todos});

  AppState.initialState()
      : devices = Device(),
        users = User(),
        todos = ToDo(todo: []);

  static AppState fromJson(dynamic json) {
    print(json);
    if (json != null) {
      return AppState(
        devices: Device.fromJson(json['devices']),
        todos: ToDo.fromJson(json['todos']),
      );
    } else {
      return AppState.initialState();
    }
  }

  dynamic toJson() => {
    'devices': devices,
    'users': users,
    'todos': todos,
  };

}
