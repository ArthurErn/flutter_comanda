class ComplementoModel {
  int idGrupo;
  int complementosQtdeMaxima;
  int item;
  String nomeComplemento;
  dynamic valor;
  int status;

  ComplementoModel(
      {this.idGrupo,
      this.complementosQtdeMaxima,
      this.item,
      this.nomeComplemento,
      this.valor,
      this.status});

  ComplementoModel.fromJson(Map<String, dynamic> json) {
    idGrupo = json["idGrupo"];
    complementosQtdeMaxima = json['complementosQtdeMaxima'];
    item = json['item'];
    nomeComplemento = json['nomeComplemento'];
    valor = json['valor'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["idGrupo"] = this.idGrupo;
    data['complementosQtdeMaxima'] = this.complementosQtdeMaxima;
    data['item'] = this.item;
    data['nomeComplemento'] = this.nomeComplemento;
    data['valor'] = this.valor;
    data['status'] = this.status;
    return data;
  }
}
