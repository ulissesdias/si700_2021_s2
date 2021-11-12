import 'package:banco_de_dados_firebase/data/auth/firebase_auth.dart';
import 'package:banco_de_dados_firebase/data/cloud/firestore_database.dart';
import 'package:banco_de_dados_firebase/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((UserModel? event) {
      add(AuthServerEvent(event));
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event is AuthServerEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          FirebaseRemoteServer.helper.uid = event.userModel!.uid;
          FirebaseRemoteServer.helper.updateUserData("asdf", "asdf", 12);
          yield Authenticated(userModel: event.userModel!);
        }
      } else if (event is RegisterUser) {
        await _authenticationService.createUserWithEmailAndPassword(
            event.username, event.password);
      } else if (event is LoginUser) {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } else if (event is LoginAnonymousUser) {
        await _authenticationService.signInAnonimo();
      } else if (event is Logout) {
        await _authenticationService.signOut();
      }
    } catch (e) {
      yield AuthError(message: e.toString());
    }
  }
}
