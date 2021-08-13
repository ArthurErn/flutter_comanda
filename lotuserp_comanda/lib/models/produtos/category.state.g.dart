// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryState on _CategoryStateBase, Store {
  final _$categoryAtom = Atom(name: '_CategoryStateBase.category');

  @override
  ObservableList<CategoryModel> get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(ObservableList<CategoryModel> value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$listCategoryAsyncAction =
      AsyncAction('_CategoryStateBase.listCategory');

  @override
  Future listCategory() {
    return _$listCategoryAsyncAction.run(() => super.listCategory());
  }

  @override
  String toString() {
    return '''
category: ${category}
    ''';
  }
}
