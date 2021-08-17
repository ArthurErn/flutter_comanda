import 'dart:convert';

import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/produtos/pizza.model.dart';

import 'package:mobx/mobx.dart';

class ListPizza extends ConnectApi {
  Future listar() async {
    ObservableList<PizzaModel> pizzas = ObservableList();
    await inicializar(
            'http://$ip/mobile/comProdutosPizzas?pidempresa=$empresaId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        PizzaModel pizza = new PizzaModel(
            idEmpresa: item['id_empresa'],
            idProduto: item['id_produto'],
            produtoDescricao: item['produto_descricao'],
            pvenda: item['pvenda'],
            valorTamPequeno: item['valor_tam_pequeno'],
            valorTamMedio: item['valor_tam_medio'],
            valorTamGrande: item['valor_tam_grande'],
            valorTamFamilia: item['valor_tam_familia'],
            qtde_inicial: item['qtde_inicial']);
        pizzas.add(pizza);
      }
    });
    return pizzas;
  }
}
