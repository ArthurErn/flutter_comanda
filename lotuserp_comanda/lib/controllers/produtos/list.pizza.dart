import 'dart:convert';

import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/pizza.model.dart';

import 'package:mobx/mobx.dart';

class ListPizza extends ConnectApi {
  Future listar() async {
    ObservableList<PizzaModel> pizzas = ObservableList();
    await inicializar(
            'http://$ip/comProdutosPizzas?pidempresa=$empresaId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        PizzaModel pizza = new PizzaModel(
          idEmpresa: item['idEmpresa'],
          idProduto: item['idProduto'],
          produtoDescricao: item['produtoDescricao'],
          pvenda: item['pvenda'],
          valorTamPequeno: item['valorTamPequeno'],
          valorTamMedio: item['valorTamMedio'],
          valorTamGrande: item['valorTamGrande'],
          valorTamFamilia: item['valorTamFamilia']
            );
        pizzas.add(pizza);
      }
    });
    return pizzas;
  }
}
