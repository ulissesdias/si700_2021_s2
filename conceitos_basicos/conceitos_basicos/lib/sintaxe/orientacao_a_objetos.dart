class Professor {
  // Atributos
  String _nome;
  String sobrenome;
  int idade;

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
  Professor(n, sn) {
    print("Invoquei o Construtor");
    this._nome = n;
    this.sobrenome = sn;
    this.idade = 25;
  }

  // Com nome
  Professor.meuProprioConstrutor(n, sn) {
    this._nome = n;
    this.sobrenome = sn;
    this.idade = 30;
  }
}

void main() {
  Professor p1 = new Professor("Letícia", "Lewartoski");
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
}
