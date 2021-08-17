import 'dart:convert';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/controllers/login/login_auth.dart';
import 'package:lotuserp_comanda/models/mesas/cards.state.dart';
import 'package:lotuserp_comanda/models/mesas/extrato.model.dart';
import 'package:lotuserp_comanda/models/mesas/extrato.state.dart';
import 'package:lotuserp_comanda/models/produtos/complemento.state.dart';
import 'package:lotuserp_comanda/models/produtos/pizza.state.dart';
import 'package:lotuserp_comanda/models/produtos/product.state.dart';
import 'package:lotuserp_comanda/views/content/content_page.dart';
import 'package:lotuserp_comanda/views/mesas/complemento.dart';
import 'package:lotuserp_comanda/views/mesas/mesas.dart';
import 'package:lotuserp_comanda/views/mesas/quantidade.dart';
import 'package:mobx/mobx.dart';

class ListExtrato extends ConnectApi {
  Future listar() async {
    ObservableList<ExtratoMesaModel> extratos = ObservableList();
    await inicializar(
            'http://$ip/mobile/comMesasExtrato?pidvenda=${cards.cards[indice].idVenda}')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ExtratoMesaModel extrato = new ExtratoMesaModel(
            idVenda: item['id_venda'],
            item: item['item'],
            idProduto: item['id_produto'],
            produtoNome: item['produto_nome'],
            qtde: item['qtde'],
            vlrLiquido: item['vlr_liquido'],
            vlrVendido: item['vlr_vendido'],
            idVendedor: item['id_vendedor'],
            atendenteNome: item['atendente_nome'],
            userNome: item['user_nome'],
            userDataHora: item['user_data_hora'],
            userHost: item['user_host'],
            produtoComplemento: item['produto_complemento']);
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
            : pizza.pizzaSelecionada[0].produtoDescricao + "\n"
        : '';
    var sabor2 = pizza.pizzaSelecionada.length >= 2
        ? pizza.pizzaSelecionada[1].produtoDescricao == null
            ? ""
            : pizza.pizzaSelecionada[1].produtoDescricao + "\n"
        : '';
    var sabor3 = pizza.pizzaSelecionada.length >= 3
        ? pizza.pizzaSelecionada[2].produtoDescricao == null
            ? ""
            : pizza.pizzaSelecionada[2].produtoDescricao + "\n"
        : '';
    var complemento = product.product[indiceProduto].produtoPizza == 1
        ? '\n' + sabor1 + sabor2 + sabor3 + "\n" + tamanhoPizza
        : "";
    var aux = 0;
    String complementoProduto;
    List<String> add = [];
    // ignore: unused_local_variable
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
    await postar('http://$ip/mobile/comMesasInserirItem', jsonData).then((response) {
      extrato.listarExtrato();
    });
  }
}
