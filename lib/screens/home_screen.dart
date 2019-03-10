import 'package:flutter/material.dart';
import 'package:flutterlogin/models/models.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/actions/device_action.dart';
import 'package:flutterlogin/actions/todo_action.dart';
import 'package:flutterlogin/models/device_model.dart';
import 'package:flutterlogin/models/todo_model.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
            appBar: AppBar(
              title: Text('home screen'),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(model.devices.name),
                    accountEmail: Text('welcome!'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      model.onLogout(false);
                    },
                    title: Text('logout'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/quote');
                    },
                    title: Text('quote'),
                  )
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'todo?'),
                    onSubmitted: (str) {
                      model.onAddTodo(str);
                      controller.text = '';
                    },
                  ),
                  Expanded(
                    child: ListView(
                      children: model.todos.todo.map((t) {
                          return ListTile(
                            title: Text(t),
                            leading: IconButton(
                              onPressed: () {
                                model.onRemoveTodo(t);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          );
                        },
                      ).toList(),
                    ),
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
  ToDo todos;
  Function(bool) onLogout;
  Function(String) onAddTodo;
  Function(String) onRemoveTodo;

  _ViewModel(
      {this.devices,
      this.todos,
      this.onLogout,
      this.onAddTodo,
      this.onRemoveTodo});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogout(bool status) {
      store.dispatch(LogoutAction(status: status));
    }

    _onAddTodo(String item) {
      store.dispatch(AddTodoAction(item: item));
    }

    _onRemoveTodo(String item) {
      store.dispatch(RemoveTodoAction(item: item));
    }

    return _ViewModel(
      todos: store.state.todos,
      devices: store.state.devices,
      onLogout: _onLogout,
      onAddTodo: _onAddTodo,
      onRemoveTodo: _onRemoveTodo,
    );
  }
}
