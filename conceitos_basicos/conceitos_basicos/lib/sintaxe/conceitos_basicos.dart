// Isto é um comentário

/*

*/
import 'dart:math';

import 'orientacao_a_objetos.dart';

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

String estruturaDados() {
  /*

  Listas 

  */

  // Declaração de uma lista genérica List<dynamic>
  List<dynamic> seq = ["a", "e", "i", 1, 2];
  seq[2] = "Vitor Prado de Lima";
  print(seq[2]);

  // Fixar os tipos dos elementos na lista
  List<int> seq2 = [1, 2, 3, 4];
  seq2.add(5);
  seq2.removeAt(1);
  print(seq2);
  print("O índice do 3 é: ${seq2.indexOf(3)}");

  /*

    Dicionários

  */
  Map<dynamic, dynamic> dict = {
    "key": "value",
    1: "one",
    3.14: "pi",
    "flag": true,
  };
  print(dict.runtimeType);
  print("O valor em 3.14 é ${dict[3.14]}");
  print("O valor em 1 é ${dict[1]}");

  dict.remove("flag");
  print(dict);

  print("Chaves = ${dict.keys}; Valores =  ${dict.values}");
  print("");
  dict.forEach((chave, valor) {
    print("Wong: $chave --> $valor");
  });

  /*

  Conjuntos

  */
  Set sacolaDeAlunos = Set();

  sacolaDeAlunos.addAll([
    "Arthur Felipe",
    "Lucas Samuel",
    "Vitor Prado",
    "Guilherme Leme",
    "Lewartoski"
  ]);

  print("");
  sacolaDeAlunos.forEach(print);
  print("");

  //sacolaDeAlunos[1];
  return "Saindo da Função";
}

enum Disciplinas { SI700, SI202, SI101, SI100 }
String operadoresCondicionais() {
  var disciplina = Disciplinas.SI100;
  String output = "";
  print(disciplina.runtimeType);

  switch (disciplina) {
    case Disciplinas.SI100:
      output += "Coelho \n";
      break;
    case Disciplinas.SI101:
    case Disciplinas.SI700:
      output += "Ulisses \n";
      break;
    case Disciplinas.SI202:
      output += "De Angelis \n";
      break;
  }

  var professor = "Ulisses";
  if (professor == "Ulisses" || professor == "Meira") {
    output += "FT \n";
  } else if (professor == "Zanoni") {
    output += "IC \n";
  } else {
    output += "Não sei quem é";
  }

  bool a = false;
  int b = 1;
  int c = 2;
  var d = "uuu";

  output += "${a ? b : c} \n";

  output += "${d ?? 'asdf'} \n";
  return output;
}

String lacosRepeticao() {
  String output = "";

  int count = 0;
  while (count < 4) {
    output += "Count = $count, ";
    count += 1;
  }

  var soma = 0;
  for (var i = 1; i <= 10; i++) {
    soma += i;
  }
  output += "\n For convencional: $soma";

  soma = 0;
  List<int> numeros = [1, 2, 3, 4];
  for (var num in numeros) {
    soma += num;
  }
  output += "\n For iteração sobre lista: $soma";

  numeros.forEach(print);
  return output;
}

/* 
  Aula 02
*/
findArea(altura, int largura) {
  return "A área é: ${altura * largura} \n";
}

void helloUser(user) {
  print("Hello $user");
}

// Arrow
String findPerimetro(int altura, int largura) =>
    "findPerimetro: ${2 * (altura + largura)}";

doSomething(a, b, funcao) => "doSomething: ${funcao(a, b)}";

parametrosOpcionaisPosicionais(a, b, [c, d]) {
  return "Obrigatórios: $a, $b, Opcionais: $c, $d";
}

parametrosOpcionaisNomeados(a, b, {c, d}) {
  return "Obrigatórios: $a, $b, Opcionais: $c, $d";
}

parametrosOpcionaisDefault(a, b, {c = "default", d = "default"}) {
  return "Obrigatórios: $a, $b, Opcionais: $c, $d";
}

lancandoExcecoes() {
  Random random = new Random();
  int randomNumber = random.nextInt(3);

  print(randomNumber);

  if (randomNumber == 0) {
    throw "Lancei algo em String";
  } else if (randomNumber == 1) {
    throw FormatException("Lancei uma FormatException");
  } else {
    throw Exception("Lancei uma Exception");
  }
}

capturandoExcecoes() {
  try {
    lancandoExcecoes();
  } on FormatException {
    return "Chegou uma FormatException, o objeto não importa";
  } on Exception catch (obj) {
    return "Capturei uma Exception que é: $obj \n";
  } catch (obj) {
    return "Capturei algo e não importa o tipo: $obj \n";
  } finally {
    print("Fiz tudo o que devia ter feito");
  }
}

void main() {
  /*
  
  print("Hello World");

  print(declararTipos());
  print(naoDeclararTipos());
  print(tipoDinamico());

  print(conversaoTipo());

  print(estruturaDados());

  print(operadoresCondicionais());

  print(lacosRepeticao());

  print(findArea(5, 10));
  print(findPerimetro(5, 10));
//  helloUser("Lucas");

  print(doSomething(5, 10, findArea));
  print(doSomething(5, 10, findPerimetro)); 

  print(doSomething("a", "b", (x, y) {
    return "${x + y}";
  }));

  print(doSomething("a", "b", (x, y) => "$x, $y"));

  print("");

  print(parametrosOpcionaisPosicionais(5, 10));
  print(parametrosOpcionaisPosicionais(5, 10, 15));
  print(parametrosOpcionaisPosicionais(5, 10, 15, 20));

  // print(parametrosOpcionaisPosicionais(5));
  // print(parametrosOpcionaisPosicionais(5, 10, 15,20,25));

  print(parametrosOpcionaisNomeados(5, 10));
  print(parametrosOpcionaisNomeados(5, 10, d: 15));
  print(parametrosOpcionaisNomeados(5, 10, d: 15, c: 20));

  print("");
  print(parametrosOpcionaisDefault(5, 10));
  print(parametrosOpcionaisDefault(5, 10, d: 15));
  print(parametrosOpcionaisDefault(5, 10, d: 15, c: 20));*/

  print(capturandoExcecoes());


  Professor p1 = new Professor("a","b");
  print(p1.sobrenome);
  print(p1.idade);
  //print(p1._nome);
}
