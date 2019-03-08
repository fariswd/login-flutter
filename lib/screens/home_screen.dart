import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home screen'),),
      body: Container(
        child: Text('this is home screen'),
      ),
    );
  }
}