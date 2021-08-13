class ProductModel {
  int idProduto;
  String descricao;
  String unidade;
  String gtin;
  dynamic saldoGeral;
  int composto;
  int idGrupo;
  String grupoEscricao;
  int grupoQtdeItens;
  dynamic pvenda;
  int produtoPizza;
  dynamic valorTamPequeno;
  dynamic valorTamMedio;
  dynamic valorTamGrande;
  dynamic valorTamFamilia;

  ProductModel(
      {this.idProduto,
      this.descricao,
      this.unidade,
      this.gtin,
      this.saldoGeral,
      this.composto,
      this.idGrupo,
      this.grupoEscricao,
      this.grupoQtdeItens,
      this.pvenda,
      this.produtoPizza,
      this.valorTamPequeno,
      this.valorTamMedio,
      this.valorTamGrande,
      this.valorTamFamilia});

  ProductModel.fromJson(Map<String, dynamic> json) {
    idProduto = json['idProduto'];
    descricao = json['descricao'];
    unidade = json['unidade'];
    gtin = json['gtin'];
    saldoGeral = json['saldoGeral'];
    composto = json['composto'];
    idGrupo = json['idGrupo'];
    grupoEscricao = json['grupoEscricao'];
    grupoQtdeItens = json['grupoQtdeItens'];
    pvenda = json['pvenda'];
    produtoPizza = json['produtoPizza'];
    valorTamPequeno = json['valorTamPequeno'];
    valorTamMedio = json['valorTamMedio'];
    valorTamGrande = json['valorTamGrande'];
    valorTamFamilia = json['valorTamFamilia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduto'] = this.idProduto;
    data['descricao'] = this.descricao;
    data['unidade'] = this.unidade;
    data['gtin'] = this.gtin;
    data['saldoGeral'] = this.saldoGeral;
    data['composto'] = this.composto;
    data['idGrupo'] = this.idGrupo;
    data['grupoEscricao'] = this.grupoEscricao;
    data['grupoQtdeItens'] = this.grupoQtdeItens;
    data['pvenda'] = this.pvenda;
    data['produtoPizza'] = this.produtoPizza;
    data['valorTamPequeno'] = this.valorTamPequeno;
    data['valorTamMedio'] = this.valorTamMedio;
    data['valorTamGrande'] = this.valorTamGrande;
    data['valorTamFamilia'] = this.valorTamFamilia;
    return data;
  }
}