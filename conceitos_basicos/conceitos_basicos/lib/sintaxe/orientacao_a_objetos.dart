class Professor {
  // Atributos
  String _nome = "";
  String sobrenome = "";
  int idade = 12;

  // Getter
  String get nome {
    return _nome;
  }

  // Setter
  set nome(n) {
    _nome = n;
  }

  String get nomeCompleto {
    return "$_nome $sobrenome";
  }

  // Métodos

  // Sem nome, sem parâmetro
  /*
  Professor() {
    print("Invoquei o Construtor");
    this._nome = "Ulisses";
    this.sobrenome = "Dias";
    this.idade = 38;
  }*/

  
  // Sem nome, com parâmetro
  Professor(this._nome, this.sobrenome) {
    print("Invoquei o Construtor");
    this.idade = 25;
  }

  
  // Com nome
  Professor.meuProprioConstrutor(n, sn) {
    this._nome = n;
    this.sobrenome = sn;
    this.idade = 30;
  }
}

class ProfessorEmergencial extends Professor {

  ProfessorEmergencial(n, sn) : super.meuProprioConstrutor(n, sn) {
    print("Invoquei construtor na classe filha");
  }

  String displayName(){
    return "$_nome $sobrenome";
  }

  static String getVinculo(){
    return "Unicamp";
  }
}

abstract class Pessoa {
  metodoAbstrato();

  metodoConcreto(id){
    // Corpo do método
  }
}

class PessoaHerdada extends Pessoa{
  metodoAbstrato(){
    print("O método abstrato recebeu corpo na classe concreta");
  }
}

class PessoaImplementada implements Pessoa {
  metodoAbstrato(){
    print("Um método abstrato sendo concretizado");
  }

  metodoConcreto(id){
    print("Tive que implementar novamente o método concreto");
  }
  
}

void main() {
  Professor p1 = new Professor("Letícia", "Lewardosky");
  print(p1.sobrenome);
  print(p1.idade);
  print(p1._nome);
  print("");
  print(p1.nomeCompleto);
  print(p1.nome);
  p1.nome = "asdf";

  print("");
  Professor p2 = new Professor.meuProprioConstrutor("Vitor", "Prado");
  print(p2.nomeCompleto);
  //print(p2.displayName());

  print("");
  
  ProfessorEmergencial p3 = new ProfessorEmergencial("Arthur", "Felipe");
  print(p3.displayName());

  print(ProfessorEmergencial.getVinculo());
  
  print("");
  Pessoa pessoa = new PessoaHerdada();
  pessoa.metodoAbstrato();
}
