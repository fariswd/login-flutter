import 'package:flutter/material.dart';
import 'package:flutterlogin/model/model.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterlogin/redux/actions/device_action.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
        appBar: AppBar(
          title: Text('home screen'),
        ),
        body: Container(
          child: RaisedButton(
            onPressed: () {
              model.onLogout(false);
            },
            child: Text('logout'),
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  Function(bool) onLogout;

  _ViewModel({this.onLogout});

  factory _ViewModel.create(Store<AppState> store){
    _onLogout(bool status){
      store.dispatch(LogoutAction(status: status));
    }

    return _ViewModel(
      onLogout: _onLogout
    );
  }
}