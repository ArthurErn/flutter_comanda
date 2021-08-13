import 'package:ifood_flutter_clone/controllers/produtos/list.category.dart';
import 'package:ifood_flutter_clone/models/produtos/category.model.dart';
import 'package:mobx/mobx.dart';
part 'category.state.g.dart';

var categories = new CategoryState();

class CategoryState = _CategoryStateBase with _$CategoryState;

abstract class _CategoryStateBase with Store {
  
  @observable
  ObservableList<CategoryModel> category = ObservableList();

  @action
  listCategory() async{
    await ListCategory().listar().then((lista) {
      category.clear();
      category.addAll(lista);
    });
  }
}
