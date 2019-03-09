import 'package:flutterlogin/models/device_model.dart';
import 'package:flutterlogin/models/user_model.dart';

class AppState {
  final Device devices;
  final User users;

  AppState({this.devices, this.users});

  AppState.initialState()
      : devices = Device(),
        users = User();

  static AppState fromJson(dynamic json) {
    print(json);
    if (json != null) {
      return AppState(
        devices: Device.fromJson(json['devices']),
      );
    } else {
      return AppState.initialState();
    }
  }

  dynamic toJson() => {
    'devices': devices,
    'users': users,
  };

}
