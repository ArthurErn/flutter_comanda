// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extrato.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExtratoState on _ExtratoStateBase, Store {
  final _$extratoAtom = Atom(name: '_ExtratoStateBase.extrato');

  @override
  ObservableList<ExtratoMesaModel> get extrato {
    _$extratoAtom.reportRead();
    return super.extrato;
  }

  @override
  set extrato(ObservableList<ExtratoMesaModel> value) {
    _$extratoAtom.reportWrite(value, super.extrato, () {
      super.extrato = value;
    });
  }

  final _$formatadoAtom = Atom(name: '_ExtratoStateBase.formatado');

  @override
  String get formatado {
    _$formatadoAtom.reportRead();
    return super.formatado;
  }

  @override
  set formatado(String value) {
    _$formatadoAtom.reportWrite(value, super.formatado, () {
      super.formatado = value;
    });
  }

  final _$listarExtratoAsyncAction =
      AsyncAction('_ExtratoStateBase.listarExtrato');

  @override
  Future listarExtrato() {
    return _$listarExtratoAsyncAction.run(() => super.listarExtrato());
  }

  final _$postarExtratoAsyncAction =
      AsyncAction('_ExtratoStateBase.postarExtrato');

  @override
  Future postarExtrato() {
    return _$postarExtratoAsyncAction.run(() => super.postarExtrato());
  }

  final _$_ExtratoStateBaseActionController =
      ActionController(name: '_ExtratoStateBase');

  @override
  String calcularTotal() {
    final _$actionInfo = _$_ExtratoStateBaseActionController.startAction(
        name: '_ExtratoStateBase.calcularTotal');
    try {
      return super.calcularTotal();
    } finally {
      _$_ExtratoStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
extrato: ${extrato},
formatado: ${formatado}
    ''';
  }
}
