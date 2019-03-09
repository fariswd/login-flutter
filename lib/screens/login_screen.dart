import 'package:flutter/material.dart';
import 'package:flutterlogin/models/models.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterlogin/actions/device_action.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  String name;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'name?'),
                    onChanged: (str) {
                      this.setState(() {
                        name = str;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  RaisedButton(
                    onPressed: () {
                      model.onLogin(true, name);
                    },
                    child: Text('login'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class _ViewModel {
  final Function(bool, String) onLogin;

  _ViewModel({this.onLogin});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogin(bool status, String name) {
      store.dispatch(LoginAction(status: status, name: name));
    }

    return _ViewModel(
      onLogin: _onLogin,
    );
  }
}
