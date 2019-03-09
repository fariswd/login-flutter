class ToDo {
  final List todo;

  ToDo({this.todo});

  ToDo copyWith({List todo}) {
    return ToDo(
      todo: todo ?? this.todo,
    );
  }

  Map toJson() => {
    'todo': todo
  };

  static ToDo fromJson(json) {
    return ToDo(
      todo: json['todo'],
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

}