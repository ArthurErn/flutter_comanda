import 'dart:convert';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/complemento.model.dart';
import 'package:ifood_flutter_clone/models/produtos/product.state.dart';
import 'package:mobx/mobx.dart';

class ListComplemento extends ConnectApi {
  Future listar() async {
    ObservableList<ComplementoModel> complementos = ObservableList();
    await inicializar('http://$ip/comGruposComplementos?pidgrupo=$grupoId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);

      for (var item in tagsJson) {
        ComplementoModel complemento = new ComplementoModel(
            item: item['item'],
            nomeComplemento: item['nomeComplemento'],
            valor: item['valor'],
            complementosQtdeMaxima: item['complementosQtdeMaxima'],
            status: item['status'],
            idGrupo: item['idGrupo']);

        complementos.add(complemento);
      }
    });
    return complementos;
  }
}
