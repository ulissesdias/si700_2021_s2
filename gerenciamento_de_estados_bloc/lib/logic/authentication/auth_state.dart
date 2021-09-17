abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String nome;
  Authenticated({this.nome});
}
