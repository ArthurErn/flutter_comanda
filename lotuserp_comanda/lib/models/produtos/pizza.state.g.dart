// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PizzaState on _PizzaStateBase, Store {
  final _$pizzasAtom = Atom(name: '_PizzaStateBase.pizzas');

  @override
  ObservableList<PizzaModel> get pizzas {
    _$pizzasAtom.reportRead();
    return super.pizzas;
  }

  @override
  set pizzas(ObservableList<PizzaModel> value) {
    _$pizzasAtom.reportWrite(value, super.pizzas, () {
      super.pizzas = value;
    });
  }

  final _$pizzaSelecionadaAtom = Atom(name: '_PizzaStateBase.pizzaSelecionada');

  @override
  ObservableList<PizzaModel> get pizzaSelecionada {
    _$pizzaSelecionadaAtom.reportRead();
    return super.pizzaSelecionada;
  }

  @override
  set pizzaSelecionada(ObservableList<PizzaModel> value) {
    _$pizzaSelecionadaAtom.reportWrite(value, super.pizzaSelecionada, () {
      super.pizzaSelecionada = value;
    });
  }

  final _$listarPizzasAsyncAction = AsyncAction('_PizzaStateBase.listarPizzas');

  @override
  Future listarPizzas() {
    return _$listarPizzasAsyncAction.run(() => super.listarPizzas());
  }

  final _$adicionarPizzaAsyncAction =
      AsyncAction('_PizzaStateBase.adicionarPizza');

  @override
  Future adicionarPizza() {
    return _$adicionarPizzaAsyncAction.run(() => super.adicionarPizza());
  }

  @override
  String toString() {
    return '''
pizzas: ${pizzas},
pizzaSelecionada: ${pizzaSelecionada}
    ''';
  }
}
