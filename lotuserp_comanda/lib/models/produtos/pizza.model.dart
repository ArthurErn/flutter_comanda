class PizzaModel {
  int idEmpresa;
  int idProduto;
  String produtoDescricao;
  dynamic pvenda;
  dynamic valorTamPequeno;
  dynamic valorTamMedio;
  dynamic valorTamGrande;
  dynamic valorTamFamilia;

  PizzaModel(
      {this.idEmpresa,
      this.idProduto,
      this.produtoDescricao,
      this.pvenda,
      this.valorTamPequeno,
      this.valorTamMedio,
      this.valorTamGrande,
      this.valorTamFamilia});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    idEmpresa = json['idEmpresa'];
    idProduto = json['idProduto'];
    produtoDescricao = json['produtoDescricao'];
    pvenda = json['pvenda'];
    valorTamPequeno = json['valorTamPequeno'];
    valorTamMedio = json['valorTamMedio'];
    valorTamGrande = json['valorTamGrande'];
    valorTamFamilia = json['valorTamFamilia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEmpresa'] = this.idEmpresa;
    data['idProduto'] = this.idProduto;
    data['produtoDescricao'] = this.produtoDescricao;
    data['pvenda'] = this.pvenda;
    data['valorTamPequeno'] = this.valorTamPequeno;
    data['valorTamMedio'] = this.valorTamMedio;
    data['valorTamGrande'] = this.valorTamGrande;
    data['valorTamFamilia'] = this.valorTamFamilia;
    return data;
  }
}
