import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterUser) {
    } else if (event is LoginUser) {
      if (event.password == "asdf") {
        yield Authenticated(nome: event.username);
      }
    } else if (event is LoginAnonymousUser) {
      yield Authenticated(nome: '');
    } else if (event is Logout) {
      yield Unauthenticated();
    }
  }
}
