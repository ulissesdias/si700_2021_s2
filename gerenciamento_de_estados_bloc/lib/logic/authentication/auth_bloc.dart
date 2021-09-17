import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginUser) {
      if (event.password == "asdf") {
        yield Authenticated(nome: event.username);
      }
    } else if (event is LoginAnonymousUser) {
      yield Authenticated();
    } else if (event is Logout) {
      yield Unauthenticated();
    }
  }
}
