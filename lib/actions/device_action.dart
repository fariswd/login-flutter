class LoginAction {
  final bool status;
  final String name;
  LoginAction({this.status, this.name});
}

class LogoutAction {
  final bool status;
  LogoutAction({this.status});
}