import 'dart:convert';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/produtos/product.model.dart';
import 'package:lotuserp_comanda/models/produtos/product.state.dart';
import 'package:mobx/mobx.dart';

class ListProduct extends ConnectApi {
  Future listar() async {
    ObservableList<ProductModel> products = ObservableList();
    await inicializar(
            'http://$ip/mobile/comGruposProdutos?pidempresa=$empresaId&pidgrupo=$grupoId')
        .then((response) {
      String json = response.body;
      dynamic tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ProductModel product = new ProductModel(
          idProduto: item['id_produto'],
          descricao: item['descricao'],
          unidade: item['unidade'],
          gtin: item['gtin'],
          pvenda: item['pvenda'],
          saldoGeral: item['saldo_geral'],
          produtoPizza: item['produto_pizza'],
          composto: item['composto'],
          idGrupo: item['id_grupo'],
          grupoEscricao: item['grupo_escricao'],
          grupoQtdeItens: item['grupo_qtde_itens'],
          valorTamPequeno: item['valor_tam_pequeno'],
          valorTamMedio: item['valor_tam_medio'],
          valorTamGrande: item['valor_tam_grande'],
          valorTamFamilia: item['valor_tam_familia'],
        );

        products.add(product);
      }
    });
    return products;
  }
}
