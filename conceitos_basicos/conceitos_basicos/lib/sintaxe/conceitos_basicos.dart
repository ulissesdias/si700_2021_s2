// Isto é um comentário

/*

*/
String declararTipos() {
  String name = "Ulisses";
  int idade = 38;
  double altura = 1.74;
  bool casado = true;

  return "$name, $idade, $altura, $casado";
}

String naoDeclararTipos() {
  var name = "Ulisses";
  var idade = 38;
  var altura = 1.74;
  var casado = true;

  print(altura.runtimeType);

  if (altura is int) {
    print("inteiro aqui");
  } else {
    print("Não é inteiro.");
  }

  return "$name, $idade, $altura, $casado";
}

String tipoDinamico() {
  print("\n \n");

  dynamic altura = 1.74;
  var tipo1 = altura.runtimeType;

  altura = "Lewartoski";
  var tipo2 = altura.runtimeType;

  return "$tipo1, $tipo2";
}

String constAndFinal() {
  // Um valor deve ser atribuído
  // em tempo de compilação
  const altura = 1.74;

  // O valor da constante abaixo
  // pode ser atribuído em tempo
  // de execução.
  final agora = DateTime.now();

  return "$altura, $agora \n";
}

String conversaoTipo() {
  int idade = 38;
  double altura = 1.74;

  String si = idade.toString();
  String sa = altura.toString();

  int id1 = int.parse(si);
  double sa1 = double.parse(sa);

  return ("$idade, $altura || $si, $sa || $id1, $sa1");
}

void main() {
  print("Hello World");

  print(declararTipos());
  print(naoDeclararTipos());
  print(tipoDinamico());

  print(conversaoTipo());
}
