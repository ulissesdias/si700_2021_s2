import 'package:banco_de_dados_firebase/data/auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterUser) {
      await _authenticationService.createUserWithEmailAndPassword(
          event.username, event.password);
      print("CREATED");
    } else if (event is LoginUser) {
      _authenticationService.signInWithEmailAndPassword(
          event.username, event.password);

      yield Authenticated(nome: event.username);
    } else if (event is LoginAnonymousUser) {
      _authenticationService.signInAnonimo();
      yield Authenticated(nome: '');
    } else if (event is Logout) {
      await _authenticationService.signOut();
      yield Unauthenticated();
    }
  }
}
