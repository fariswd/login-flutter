import 'package:redux/redux.dart';

import 'package:flutterlogin/reducers/reducers.dart';
import 'package:flutterlogin/models/models.dart';

Store<AppState> store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initialState(),
  middleware: [],
);
