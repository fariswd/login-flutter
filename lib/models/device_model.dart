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
        'id': id,
        'name': name,
        'isLogin': isLogin,
      };

  static Device fromJson(json) {
    return Device(
      id: json['id'],
      name: json['name'],
      isLogin: json['isLogin'],
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
