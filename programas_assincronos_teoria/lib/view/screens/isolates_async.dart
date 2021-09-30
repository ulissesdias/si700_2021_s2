import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:programas_assincronos_teoria/view/screens/fibonacci.dart';

class IsolatesAsync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [generateIsolateButton(context)],
    );
  }

  Widget generateIsolateButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          int fib = await compute(fibonacci, 45);
          ScaffoldMessenger.of(context)
              .showSnackBar(generateSnackBar("Promise Finished: $fib"));
        },
        child: Text("Executando em novo Isolate"));
  }

  Widget generateSnackBar(String text) {
    return SnackBar(
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 2),
      content: Text(text),
    );
  }
}
