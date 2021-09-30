import 'package:flutter/material.dart';
import 'package:programas_assincronos_teoria/view/screens/fibonacci.dart';

class PromisesAsync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Criará um evento executado de maneira síncrona
        generateSyncCPUHeavyButton(context),
        generateSyncCPULightButton(context),
        generateAsyncCPUHeavyButton(context),
        generateAsyncButtonThen(context)
      ],
    );
  }

  /*
  Processos pesados
  */

  int processoLongoComMuitaCpuSync() {
    return fibonacci(45);
  }

  Future<int> processoLongoComMuitaCpuAsync() {
    return Future(() {
      int n = fibonacci(45);
      return n;
    });
  }

  Future<int> processoLongoSemUsoDeCpuAsync() async {
    await Future.delayed(Duration(seconds: 5));
    return 42;
  }

  /*
  Botões
  */
  // Processo pesado síncrono com uso de CPU
  Widget generateSyncCPUHeavyButton(context) {
    return ElevatedButton(
        onPressed: () {
          int n = processoLongoComMuitaCpuSync();
          ScaffoldMessenger.of(context)
              .showSnackBar(generateSnackBar("Síncrono acabou $n"));
        },
        child: Text("Todo Síncrono"));
  }

  // Processo pesado síncrono sem uso de CPU
  Widget generateSyncCPULightButton(context) {
    return ElevatedButton(
        onPressed: () async {
          int n = await processoLongoSemUsoDeCpuAsync();
          ScaffoldMessenger.of(context)
              .showSnackBar(generateSnackBar("Síncrono Leve acabou $n"));
        },
        child: Text("SnackBar Síncrono Leve  (Async Button)"));
  }

  // Processo pesado síncrono sem uso de CPU
  Widget generateAsyncCPUHeavyButton(context) {
    return ElevatedButton(
        onPressed: () async {
          try {
            int n = await processoLongoComMuitaCpuAsync();
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Síncrono Leve acabou $n"));
          } catch (e) {}
        },
        child: Text("SnackBar Síncrono Pesado (Async Button)"));
  }

  Widget generateAsyncButtonThen(BuildContext context) {
    return ElevatedButton(
      child: Text("Snackbar Síncrono com Then"),
      onPressed: () {
        Future<int> response = processoLongoSemUsoDeCpuAsync();
        response.then((int resultado) {
          ScaffoldMessenger.of(context)
              .showSnackBar(generateSnackBar("O Future acabou $resultado"));
        });
        ScaffoldMessenger.of(context).showSnackBar(
            generateSnackBar("O método do botão acabou $response"));
      },
    );
  }

  Widget generateSnackBar(String text) {
    return SnackBar(
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 2),
      content: Text(text),
    );
  }
}
