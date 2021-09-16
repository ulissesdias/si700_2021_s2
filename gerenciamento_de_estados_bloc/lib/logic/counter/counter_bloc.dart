import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/counter/counter_state.dart';

enum CounterEvent { increment, decrement }

// Mapeará Eventos em estados
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(counterValue: state.counterValue + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(counterValue: state.counterValue - 1);
        break;
    }
  }
}
