import 'package:redux/redux.dart';

import 'package:flutterlogin/model/user_model.dart';
import 'package:flutterlogin/redux/actions/user_action.dart';

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, UpdateNameAction>(updateNameReducer),
]);

User updateNameReducer(User users, UpdateNameAction action) {
  return users;
}
