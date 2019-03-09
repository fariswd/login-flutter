import 'package:redux/redux.dart';

import 'package:flutterlogin/models/user_model.dart';
import 'package:flutterlogin/actions/user_action.dart';

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, UpdateNameAction>(updateNameReducer),
]);

User updateNameReducer(User users, UpdateNameAction action) {
  return users;
}
