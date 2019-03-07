import './actions.dart';
import '../model/model.dart';

import 'package:redux/redux.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    devices: deviceReducer(state.devices, action),
  );
}

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