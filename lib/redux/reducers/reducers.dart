import 'package:flutterlogin/model/model.dart';

import 'package:flutterlogin/redux/reducers/device_reducer.dart';
import 'package:flutterlogin/redux/reducers/user_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    devices: deviceReducer(state.devices, action),
    users: userReducer(state.users, action),
  );
}