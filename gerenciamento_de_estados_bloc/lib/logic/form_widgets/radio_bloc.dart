import 'package:flutter_bloc/flutter_bloc.dart';

class RadioBloc extends Bloc<int, int> {
  RadioBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }
}
