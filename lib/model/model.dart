class Device {
  final String name;
  final bool isLogin;
  final int id;

  Device({this.id = 1, this.name, this.isLogin = false});

  Device copyWith({int id, String name, bool isLogin}) {
    return Device(
      id: id ?? 1,
      name: name ?? this.name,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  Map toJson() => {
        'id': (id as int),
        'name': name,
        'isLogin': isLogin,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

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

class AppState {
  final Device devices;
  final User users;

  AppState({this.devices, this.users});

  AppState.initialState() : devices = Device(),
                            users = User();
}
