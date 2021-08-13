// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complemento.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComplementoState on _ComplementoStateBase, Store {
  final _$complementosAtom = Atom(name: '_ComplementoStateBase.complementos');

  @override
  ObservableList<ComplementoModel> get complementos {
    _$complementosAtom.reportRead();
    return super.complementos;
  }

  @override
  set complementos(ObservableList<ComplementoModel> value) {
    _$complementosAtom.reportWrite(value, super.complementos, () {
      super.complementos = value;
    });
  }

  final _$complementosDisplayAtom =
      Atom(name: '_ComplementoStateBase.complementosDisplay');

  @override
  ObservableList<ComplementoModel> get complementosDisplay {
    _$complementosDisplayAtom.reportRead();
    return super.complementosDisplay;
  }

  @override
  set complementosDisplay(ObservableList<ComplementoModel> value) {
    _$complementosDisplayAtom.reportWrite(value, super.complementosDisplay, () {
      super.complementosDisplay = value;
    });
  }

  final _$complementosSelecionadosAtom =
      Atom(name: '_ComplementoStateBase.complementosSelecionados');

  @override
  ObservableList<ComplementoModel> get complementosSelecionados {
    _$complementosSelecionadosAtom.reportRead();
    return super.complementosSelecionados;
  }

  @override
  set complementosSelecionados(ObservableList<ComplementoModel> value) {
    _$complementosSelecionadosAtom
        .reportWrite(value, super.complementosSelecionados, () {
      super.complementosSelecionados = value;
    });
  }

  final _$valorComplementoAtom =
      Atom(name: '_ComplementoStateBase.valorComplemento');

  @override
  dynamic get valorComplemento {
    _$valorComplementoAtom.reportRead();
    return super.valorComplemento;
  }

  @override
  set valorComplemento(dynamic value) {
    _$valorComplementoAtom.reportWrite(value, super.valorComplemento, () {
      super.valorComplemento = value;
    });
  }

  final _$listarComplementosAsyncAction =
      AsyncAction('_ComplementoStateBase.listarComplementos');

  @override
  Future listarComplementos() {
    return _$listarComplementosAsyncAction
        .run(() => super.listarComplementos());
  }

  final _$adicionarComplementosAsyncAction =
      AsyncAction('_ComplementoStateBase.adicionarComplementos');

  @override
  Future adicionarComplementos() {
    return _$adicionarComplementosAsyncAction
        .run(() => super.adicionarComplementos());
  }

  final _$_ComplementoStateBaseActionController =
      ActionController(name: '_ComplementoStateBase');

  @override
  dynamic calcularComplemento() {
    final _$actionInfo = _$_ComplementoStateBaseActionController.startAction(
        name: '_ComplementoStateBase.calcularComplemento');
    try {
      return super.calcularComplemento();
    } finally {
      _$_ComplementoStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
complementos: ${complementos},
complementosDisplay: ${complementosDisplay},
complementosSelecionados: ${complementosSelecionados},
valorComplemento: ${valorComplemento}
    ''';
  }
}
