import 'dart:convert';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/produtos/complemento.model.dart';
import 'package:lotuserp_comanda/models/produtos/product.state.dart';
import 'package:mobx/mobx.dart';

class ListComplemento extends ConnectApi {
  Future listar() async {
    ObservableList<ComplementoModel> complementos = ObservableList();
    await inicializar('http://$ip/mobile/comGruposComplementos?pidgrupo=$grupoId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ComplementoModel complemento = new ComplementoModel(
            item: item['item'],
            nomeComplemento: item['nome_complemento'],
            valor: item['valor'],
            complementosQtdeMaxima: item['complementos_qtde_maxima'],
            status: item['status'],
            idGrupo: item['id_grupo']);

        complementos.add(complemento);
      }
    });
    return complementos;
  }
}
