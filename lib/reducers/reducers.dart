import 'package:flutterlogin/models/models.dart';

import 'package:flutterlogin/reducers/device_reducer.dart';
import 'package:flutterlogin/reducers/user_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    devices: deviceReducer(state.devices, action),
    users: userReducer(state.users, action),
  );
}