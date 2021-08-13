// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cards on _CardsBase, Store {
  final _$cardsAtom = Atom(name: '_CardsBase.cards');

  @override
  ObservableList<CardsModel> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<CardsModel> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$listarCardsAsyncAction = AsyncAction('_CardsBase.listarCards');

  @override
  Future listarCards(dynamic statusMesa) {
    return _$listarCardsAsyncAction.run(() => super.listarCards(statusMesa));
  }

  @override
  String toString() {
    return '''
cards: ${cards}
    ''';
  }
}
