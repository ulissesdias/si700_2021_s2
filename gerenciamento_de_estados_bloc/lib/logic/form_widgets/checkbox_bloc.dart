import 'package:bloc/bloc.dart';

enum CheckBoxEvent { check, uncheck }
enum CheckBoxState { checked, unchecked }

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc(CheckBoxState initialState) : super(initialState);

  @override
  Stream<CheckBoxState> mapEventToState(CheckBoxEvent event) async* {
    switch (event) {
      case CheckBoxEvent.check:
        yield CheckBoxState.checked;
        break;
      case CheckBoxEvent.uncheck:
        yield CheckBoxState.unchecked;
        break;
    }
  }
}
