import 'package:bloc/bloc.dart';

enum SwitchEvent { turn_on, turn_off }
enum SwitchState { on, off }

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc(SwitchState initialState) : super(initialState);

  @override
  Stream<SwitchState> mapEventToState(SwitchEvent event) async* {
    switch (event) {
      case SwitchEvent.turn_on:
        yield SwitchState.on;
        break;
      case SwitchEvent.turn_off:
        yield SwitchState.off;
        break;
    }
  }
}
