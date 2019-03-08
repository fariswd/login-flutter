import 'package:redux/redux.dart';

import 'package:flutterlogin/redux/actions/device_action.dart';
import 'package:flutterlogin/model/device_model.dart';


Reducer<Device> deviceReducer = combineReducers<Device>([
  TypedReducer<Device, LoginAction>(loginReducer),
  TypedReducer<Device, LogoutAction>(logoutReducer),
]);

Device loginReducer(Device devices, LoginAction action) {
  print(action.toString());
  return devices.copyWith(isLogin: true);
}

Device logoutReducer(Device devices, LogoutAction action){
  print(devices.toString());
  return devices.copyWith(isLogin: false);
}