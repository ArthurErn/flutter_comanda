import 'dart:convert';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/category.model.dart';
import 'package:mobx/mobx.dart';

class ListCategory extends ConnectApi {
  Future listar() async {
    ObservableList<CategoryModel> categories = ObservableList();
    await inicializar('http://$ip/comGrupos?pidempresa=$empresaId')
        .then((response) {
      String json = response.body;
      var tagsJson = jsonDecode(json);
      for (var item in tagsJson) {
        CategoryModel category = new CategoryModel(
            idGrupo: item['idGrupo'], grupoDescricao: item['grupoDescricao']);
        categories.add(category);
      }
    });
    return categories;
  }
}
