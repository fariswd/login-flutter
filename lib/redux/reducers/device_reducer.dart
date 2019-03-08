import 'package:redux/redux.dart';

import 'package:flutterlogin/redux/actions/device_action.dart';
import 'package:flutterlogin/model/device_model.dart';


Reducer<Device> deviceReducer = combineReducers<Device>([
  TypedReducer<Device, LoginAction>(loginReducer),
  TypedReducer<Device, LogoutAction>(logoutReducer),
]);

Device loginReducer(Device devices, LoginAction action) {
  print(devices.toString());
  return devices.copyWith(isLogin: action.status, name: action.name);
}

Device logoutReducer(Device devices, LogoutAction action){
  print(devices.toString());
  return devices.copyWith(isLogin: action.status);
}