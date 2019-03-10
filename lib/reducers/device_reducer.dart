import 'package:redux/redux.dart';

import 'package:flutterlogin/actions/device_action.dart';
import 'package:flutterlogin/models/device_model.dart';


Reducer<Device> deviceReducer = combineReducers<Device>([
  TypedReducer<Device, LoginAction>(loginReducer),
  TypedReducer<Device, LogoutAction>(logoutReducer),
]);

Device loginReducer(Device devices, LoginAction action) {
  return devices.copyWith(isLogin: action.status, name: action.name);
}

Device logoutReducer(Device devices, LogoutAction action){
  return devices.copyWith(isLogin: action.status);
}