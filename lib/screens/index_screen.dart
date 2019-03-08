import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/model/model.dart';
import 'package:flutterlogin/model/user_model.dart';
import 'package:flutterlogin/model/device_model.dart';

import 'package:flutterlogin/redux/actions/device_action.dart';
import 'package:flutterlogin/redux/actions/user_action.dart';

import './login_screen.dart';
import './home_screen.dart';

class IndexScreen extends StatelessWidget {
  // final Store<AppState> store;
  // IndexScreen(this.store);

  @override
  Widget build(BuildContext context) {
    // if (false) {
    //   return HomeScreen();
    // } else {
    //   return LoginScreen();
    // }
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('indexscreen'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => viewModel.onLogin(true),
                child: Text('login'),
              ),
              RaisedButton(
                onPressed: () => viewModel.onLogout(),
                child: Text('logout'),
              ),
              Container(
                child: Text(viewModel.users.toString()),
              )
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Device devices;
  final User users;
  final Function(bool) onLogin;
  final Function() onLogout;

  _ViewModel({this.devices, this.users, this.onLogin, this.onLogout});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogin(bool status) {
      store.dispatch(LoginAction(status: status));
    }

    _onLogout() {
      store.dispatch(LogoutAction());
    }

    return _ViewModel(
      users: store.state.users,
      devices: store.state.devices,
      onLogin: _onLogin,
      onLogout: _onLogout,
    );
  }
}
