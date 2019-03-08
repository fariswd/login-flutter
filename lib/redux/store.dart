import 'package:redux/redux.dart';

import 'package:flutterlogin/redux/reducers/reducers.dart';
import 'package:flutterlogin/model/model.dart';

Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [],
    );