import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<double, double> {
  SliderBloc(double initialState) : super(initialState);

  @override
  Stream<double> mapEventToState(double event) async* {
    /*
      Faça algo com o backend
    */
    yield event;
  }
}
