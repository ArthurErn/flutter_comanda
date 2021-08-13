class BuilderApi {
  String result;
  String mensagem;
  String usuarioId;
  String usuarioNome;
  String colaboradorId;
  String caixaId;
  String caixaData;

  BuilderApi(
      this.result,
      this.mensagem,
      this.usuarioId,
      this.usuarioNome,
      this.colaboradorId,
      this.caixaId,
      this.caixaData);

  BuilderApi.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    mensagem = json['mensagem'];
    usuarioId = json['usuario_id'];
    usuarioNome = json['usuario_nome'];
    colaboradorId = json['colaborador_id'];
    caixaId = json['caixa_id'];
    caixaData = json['caixa_data'];
  }
}
