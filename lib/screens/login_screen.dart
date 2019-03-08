import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login screen'),),
      body: Container(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, '/home'),
          child: Text('login'),
        ),
      ),
    );
  }
}