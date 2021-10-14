import 'package:flutter/material.dart';
import 'package:programas_assincronos_teoria/teoria/stream.dart';

class StreamsAsyncStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        generateListenButton(context),
        generateListenButtonWithFunctionGenerator(context),
        generateListenButtonInBroadcast(context),
        generateListenButtonWithFor(context),
        generateListenButtonWithMapAndFilder(context)
      ],
    );
  }

  Widget generateListenButton(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          await Future.delayed(Duration(seconds: 10));

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });
          // O código abaixo não funciona
          //numberStream.listen((event) {});
        },
        child: Text("Listen Stream"));
  }

  Widget generateListenButtonWithFunctionGenerator(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir

          Stream<int> numberStream = streamEnviaDados();

          await Future.delayed(Duration(seconds: 10));

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });
        },
        child: Text("Listen Stream With Function Generator"));
  }

  Widget generateListenButtonInBroadcast(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream =
              numberStreamCreator.stream.asBroadcastStream();

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received1: $data"));
          });

          await Future.delayed(Duration(seconds: 10));

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received2: $data"));
          });
        },
        child: Text("Listen Stream In Broadcast"));
  }

  Widget generateListenButtonWithFor(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          int total = 0;
          await for (int value in numberStream) {
            total += value;
            ScaffoldMessenger.of(context).showSnackBar(
                generateSnackBar("Recebido $value -- Soma: $total"));
          }
        },
        child: Text("Listen Stream With For"));
  }

  Widget generateListenButtonWithMapAndFilder(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;
          Stream<int> filteredStream =
              numberStream.where((data) => data % 2 == 0);
          Stream<String> mappedStream = filteredStream
              .map((data) => "$data ao quadrado é ${data * data}");

          mappedStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });
        },
        child: Text("Listen Stream With Map and Filter"));
  }

  Widget generateSnackBar(String text) {
    return SnackBar(
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 1),
      content: Text(text),
    );
  }
}
