// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductState on _ProductStateBase, Store {
  final _$productAtom = Atom(name: '_ProductStateBase.product');

  @override
  ObservableList<dynamic> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ObservableList<dynamic> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$productDisplayAtom = Atom(name: '_ProductStateBase.productDisplay');

  @override
  ObservableList<dynamic> get productDisplay {
    _$productDisplayAtom.reportRead();
    return super.productDisplay;
  }

  @override
  set productDisplay(ObservableList<dynamic> value) {
    _$productDisplayAtom.reportWrite(value, super.productDisplay, () {
      super.productDisplay = value;
    });
  }

  final _$listarProdutosAsyncAction =
      AsyncAction('_ProductStateBase.listarProdutos');

  @override
  Future listarProdutos() {
    return _$listarProdutosAsyncAction.run(() => super.listarProdutos());
  }

  @override
  String toString() {
    return '''
product: ${product},
productDisplay: ${productDisplay}
    ''';
  }
}
