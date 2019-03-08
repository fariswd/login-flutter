import 'package:flutter/material.dart';
import 'package:flutterlogin/model/model.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterlogin/redux/actions/device_action.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
            appBar: AppBar(
              title: Text('login screen'),
            ),
            body: Container(
              child: RaisedButton(
                onPressed: () {
                  model.onLogin(true);
                },
                child: Text('login'),
              ),
            ),
          ),
    );
  }
}

class _ViewModel {
  final Function(bool) onLogin;

  _ViewModel({this.onLogin});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogin(bool status) {
      store.dispatch(LoginAction(status: status));
    }

    return _ViewModel(
      onLogin: _onLogin,
    );
  }
}
