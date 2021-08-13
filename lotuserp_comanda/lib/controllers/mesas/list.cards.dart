import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/mesas/cards.model.dart';

var imagemFinal;

class ListCards extends ConnectApi{
  Future listar(statusMesa) async {
    ObservableList<CardsModel> cards = ObservableList();
    await inicializar('http://$ip/comMesasListar?pidempresa=$empresaId&pTipo=$statusMesa')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        CardsModel card = CardsModel(
            id: item['id'],
            descricao: item['descricao'],
            statusNome: item['statusNome'],
            idVenda: item['idVenda'],
            abData: item['abData'],
            qtdePessoas: item['qtdePessoas'],
            reservaNome: item['reservaNome'],
            reservaFone: item['reservaFone'],
            reservaHora: item['reservaHora'],
            reservaPessoas: item['reservaPessoas'],
            reservaUser: item['reservaUser'],
            totalConsumo: item['totalConsumo']);
        cards.add(card);
      }
    });
    return cards;
  }
}
