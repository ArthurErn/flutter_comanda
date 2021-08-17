import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/mesas/cards.model.dart';

var imagemFinal;

class ListCards extends ConnectApi {
  Future listar(statusMesa) async {
    ObservableList<CardsModel> cards = ObservableList();
    await inicializar(
            'http://$ip/mobile/comMesasListar?pidempresa=$empresaId&pTipo=$statusMesa')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        CardsModel card = CardsModel(
            id: item['id'],
            descricao: item['descricao'],
            statusNome: item['status_nome'],
            idVenda: item['id_venda'],
            abData: item['ab_data'],
            qtdePessoas: item['qtde_pessoas'],
            reservaNome: item['reserva_nome'],
            reservaFone: item['reserva_fone'],
            reservaHora: item['reserva_hora'],
            reservaPessoas: item['reserva_pessoas'],
            reservaUser: item['reserva_user'],
            totalConsumo: item['total_consumo']);
        cards.add(card);
      }
    });
    return cards;
  }
}
