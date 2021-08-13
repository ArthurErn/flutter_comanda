class CategoryModel {
  int idGrupo;
  String grupoDescricao;

  CategoryModel({this.idGrupo, this.grupoDescricao});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idGrupo = json['idGrupo'];
    grupoDescricao = json['grupoDescricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idGrupo'] = this.idGrupo;
    data['grupoDescricao'] = this.grupoDescricao;
    return data;
  }
}