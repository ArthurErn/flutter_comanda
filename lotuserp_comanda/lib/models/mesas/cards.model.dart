class CardsModel {
  int id;
  String descricao;
  String statusNome;
  int idVenda;
  String abData;
  int qtdePessoas;
  String reservaNome;
  String reservaFone;
  String reservaHora;
  int reservaPessoas;
  String reservaUser;
  dynamic totalConsumo;

  CardsModel(
      {this.id,
      this.descricao,
      this.statusNome,
      this.idVenda,
      this.abData,
      this.qtdePessoas,
      this.reservaNome,
      this.reservaFone,
      this.reservaHora,
      this.reservaPessoas,
      this.reservaUser,
      this.totalConsumo});

  CardsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    statusNome = json['statusNome'];
    idVenda = json['idVenda'];
    abData = json['abData'];
    qtdePessoas = json['qtdePessoas'];
    reservaNome = json['reservaNome'];
    reservaFone = json['reservaFone'];
    reservaHora = json['reservaHora'];
    reservaPessoas = json['reservaPessoas'];
    reservaUser = json['reservaUser'];
    totalConsumo = json['totalConsumo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['statusNome'] = this.statusNome;
    data['idVenda'] = this.idVenda;
    data['abData'] = this.abData;
    data['qtdePessoas'] = this.qtdePessoas;
    data['reservaNome'] = this.reservaNome;
    data['reservaFone'] = this.reservaFone;
    data['reservaHora'] = this.reservaHora;
    data['reservaPessoas'] = this.reservaPessoas;
    data['reservaUser'] = this.reservaUser;
    data['totalConsumo'] = this.totalConsumo;
    return data;
  }
}