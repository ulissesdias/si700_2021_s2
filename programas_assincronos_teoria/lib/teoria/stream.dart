import 'dart:async';

class NumberStreamCreator {
  int _count = 0;
  StreamController<int> _controller = StreamController<int>();
  NumberStreamCreator() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _count++;
      _controller.sink.add(_count);

      if (_count >= 10) {
        timer.cancel();
        _controller.close();
      }
    });
  }
  Stream<int> get stream => _controller.stream;
}

Stream<int> streamEnviaDados() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
}

recebeDadosDaStream(int dadoRecebido) {
  print("RECEBENDO MENSAGEM: $dadoRecebido");
}

void main() {
  //Stream<int> stream = streamEnviaDados();
  Stream<int> stream = NumberStreamCreator().stream;

  stream.listen(recebeDadosDaStream);
}
