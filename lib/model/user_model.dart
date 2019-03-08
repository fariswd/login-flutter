class User {
  final String name;
  final int age;

  User({this.name = 'capung', this.age = 14});

  User copyWith({String name, int age}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age
    );
  }

  Map toJson() => {
    'name': name,
    'age': age,
  };

  @override
  String toString() {
    return toJson().toString();
  }

}
