import 'dart:convert';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/product.model.dart';
import 'package:ifood_flutter_clone/models/produtos/product.state.dart';
import 'package:mobx/mobx.dart';

class ListProduct extends ConnectApi{
  Future listar() async {
    ObservableList<ProductModel> products = ObservableList();
    await inicializar(
            'http://$ip/comGruposProdutos?pidempresa=$empresaId&pidgrupo=$grupoId')
        .then((response) {
      String json = response.body;
      dynamic tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ProductModel product = new ProductModel(
            idProduto: item['idProduto'],
            descricao: item['descricao'],
            unidade: item['unidade'],
            gtin: item['gtin'],
            pvenda: item['pvenda'],
            saldoGeral: item['saldoGeral'],
            produtoPizza: item['produtoPizza'],
            composto: item['composto'],
            idGrupo: item['idGrupo'],
            grupoEscricao: item['grupoEscricao'],
            grupoQtdeItens: item['grupoQtdeItens'],
            valorTamPequeno: item['valorTamPequeno'],
            valorTamMedio: item['valorTamMedio'],
            valorTamGrande: item['valorTamGrande'],
            valorTamFamilia: item['valorTamFamilia'],
            );
            
        products.add(product);
      }
    });
    return products;
  }
}
