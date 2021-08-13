import 'dart:convert';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/controllers/login/login_auth.dart';
import 'package:ifood_flutter_clone/models/mesas/cards.state.dart';
import 'package:ifood_flutter_clone/models/mesas/extrato.model.dart';
import 'package:ifood_flutter_clone/models/mesas/extrato.state.dart';
import 'package:ifood_flutter_clone/models/produtos/complemento.state.dart';
import 'package:ifood_flutter_clone/models/produtos/pizza.state.dart';
import 'package:ifood_flutter_clone/models/produtos/product.state.dart';
import 'package:ifood_flutter_clone/views/content/content_page.dart';
import 'package:ifood_flutter_clone/views/mesas/complemento.dart';
import 'package:ifood_flutter_clone/views/mesas/mesas.dart';
import 'package:ifood_flutter_clone/views/mesas/quantidade.dart';
import 'package:mobx/mobx.dart';

class ListExtrato extends ConnectApi {
  Future listar() async {
    ObservableList<ExtratoMesaModel> extratos = ObservableList();
    await inicializar(
            'http://$ip/comMesasExtrato?pidvenda=${cards.cards[indice].idVenda}')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ExtratoMesaModel extrato = new ExtratoMesaModel(
            idVenda: item['idVenda'],
            item: item['item'],
            idProduto: item['idProduto'],
            produtoNome: item['produtoNome'],
            qtde: item['qtde'],
            vlrLiquido: item['vlrLiquido'],
            vlrVendido: item['vlrVendido'],
            idVendedor: item['idVendedor'],
            atendenteNome: item['atendenteNome'],
            userNome: item['userNome'],
            userDataHora: item['userDataHora'],
            userHost: item['userHost'],
            produtoComplemento: item['produtoComplemento']);
        extratos.add(extrato);
      }
    });
    return extratos;
  }

  Future postarExtrato() async {
    var tamanhoPizza = grande == true
        ? "TAMANHO: GRANDE"
        : familia == true
            ? "TAMANHO: FAMILIA"
            : media == true
                ? "TAMANHO: MEDIA"
                : "TAMANHO: PEQUENA";
    var sabor1 = pizza.pizzaSelecionada.length >= 1
        ? pizza.pizzaSelecionada[0].produtoDescricao == null
            ? ""
            : pizza.pizzaSelecionada[0].produtoDescricao
        : '';
    var sabor2 = pizza.pizzaSelecionada.length >= 2
        ? pizza.pizzaSelecionada[1].produtoDescricao == null
            ? ""
            : pizza.pizzaSelecionada[1].produtoDescricao
        : '';
    var sabor3 = pizza.pizzaSelecionada.length >= 3
        ? pizza.pizzaSelecionada[2].produtoDescricao == null
            ? ""
            : pizza.pizzaSelecionada[2].produtoDescricao
        : '';
    var complemento = product.product[indiceProduto].produtoPizza == 1
        ? '\n' + sabor1 + "\n" + sabor2 + "\n" + sabor3 + "\n\n" + tamanhoPizza
        : "";
    var aux = 0;
    String complementoProduto;
    List<String> add = [];
    for (var items in complementos.complementosSelecionados) {
      add.add(complementos.complementosSelecionados[aux].nomeComplemento);
      aux++;
    }
    complementoProduto = add.join('\n');
    var jsonData = jsonEncode([
      {
        "id_empresa": empresaId,
        "id_mesacartao": cards.cards[indice].id,
        "id_produto": product.product[indiceProduto].idProduto,
        "complemento": product.product[indiceProduto].produtoPizza != 1
            ? "\n" + complementoProduto.toString()
            : complemento,
        "vlr_vendido": product.product[indiceProduto].pvenda,
        "qtde": int.parse(quantityController.text),
        "vlr_bruto": product.product[indiceProduto].produtoPizza != 1
            ? product.product[indiceProduto].pvenda *
                    int.parse(quantityController.text) +
                complementos.valorComplemento
            : complementos.valorComplemento *
                int.parse(quantityController.text),
        "id_mesafixa": 0,
        "id_colaborador": int.parse(idColaborador),
        "id_usuario": int.parse(idUsuario),
        "id_caixa": int.parse(caixaId),
        "data_caixa": caixaData
      }
    ]);
    await postar('http://$ip/comMesasInserirItem', jsonData).then((response) {
      extrato.listarExtrato();
    });
  }
}
