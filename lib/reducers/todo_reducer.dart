import 'package:redux/redux.dart';

import 'package:flutterlogin/models/todo_model.dart';
import 'package:flutterlogin/actions/todo_action.dart';

Reducer<ToDo> todoReducer =combineReducers<ToDo>([
  TypedReducer<ToDo, AddTodoAction>(addReducer),
  TypedReducer<ToDo, RemoveTodoAction>(removeReduder),
  TypedReducer<ToDo, UpdateTodoAction>(updateReducer),
]);

ToDo addReducer(ToDo todos, AddTodoAction action){
  return todos.copyWith(
    todo: []..addAll(todos.todo)..add(action.item)
  );
}

ToDo removeReduder(ToDo todos, RemoveTodoAction action){
  return todos.copyWith(
    todo: []..addAll(todos.todo)..remove(action.item)
  );
}

ToDo updateReducer(ToDo todos, UpdateTodoAction action){
  return todos;
}