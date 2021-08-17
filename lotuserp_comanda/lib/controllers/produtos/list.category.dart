import 'dart:convert';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/produtos/category.model.dart';
import 'package:mobx/mobx.dart';

class ListCategory extends ConnectApi {
  Future listar() async {
    ObservableList<CategoryModel> categories = ObservableList();
    await inicializar('http://$ip/mobile/comGrupos?pidempresa=$empresaId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);
      for (var item in tagsJson) {
        CategoryModel category = new CategoryModel(
            idGrupo: item['id_grupo'], grupoDescricao: item['grupo_descricao']);
        categories.add(category);
      }
    });
    return categories;
  }
}
