class ExtratoMesaModel {
  int idVenda;
  int item;
  int idProduto;
  String produtoNome;
  int qtde;
  dynamic vlrLiquido;
  dynamic vlrVendido;
  int idVendedor;
  String atendenteNome;
  String userNome;
  String userDataHora;
  String userHost;
  String produtoComplemento;

  ExtratoMesaModel(
      {this.idVenda,
      this.item,
      this.idProduto,
      this.produtoNome,
      this.qtde,
      this.vlrLiquido,
      this.vlrVendido,
      this.idVendedor,
      this.atendenteNome,
      this.userNome,
      this.userDataHora,
      this.userHost,
      this.produtoComplemento});

  ExtratoMesaModel.fromJson(Map<String, dynamic> json) {
    idVenda = json['idVenda'];
    item = json['item'];
    idProduto = json['idProduto'];
    produtoNome = json['produtoNome'];
    qtde = json['qtde'];
    vlrLiquido = json['vlrLiquido'];
    vlrVendido = json['vlrVendido'];
    idVendedor = json['idVendedor'];
    atendenteNome = json['atendenteNome'];
    userNome = json['userNome'];
    userDataHora = json['userDataHora'];
    userHost = json['userHost'];
    produtoComplemento = json['produtoComplemento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idVenda'] = this.idVenda;
    data['item'] = this.item;
    data['idProduto'] = this.idProduto;
    data['produtoNome'] = this.produtoNome;
    data['qtde'] = this.qtde;
    data['vlrLiquido'] = this.vlrLiquido;
    data['vlrVendido'] = this.vlrVendido;
    data['idVendedor'] = this.idVendedor;
    data['atendenteNome'] = this.atendenteNome;
    data['userNome'] = this.userNome;
    data['userDataHora'] = this.userDataHora;
    data['userHost'] = this.userHost;
    data['produtoComplemento'] = this.produtoComplemento;
    return data;
  }
}