import 'package:flutterlogin/model/device_model.dart';
import 'package:flutterlogin/model/user_model.dart';

class AppState {
  final Device devices;
  final User users;

  AppState({this.devices, this.users});

  AppState.initialState() : devices = Device(),
                            users = User();
}
