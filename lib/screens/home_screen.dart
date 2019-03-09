import 'package:flutter/material.dart';
import 'package:flutterlogin/models/models.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/actions/device_action.dart';
import 'package:flutterlogin/models/device_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
            appBar: AppBar(
              title: Text('home screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Hi! ' + model.devices.name,
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      model.onLogout(false);
                    },
                    child: Text('logout'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class _ViewModel {
  Device devices;
  Function(bool) onLogout;

  _ViewModel({this.devices, this.onLogout});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogout(bool status) {
      store.dispatch(LogoutAction(status: status));
    }

    return _ViewModel(devices: store.state.devices, onLogout: _onLogout);
  }
}
