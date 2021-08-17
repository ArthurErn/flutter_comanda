import 'package:lotuserp_comanda/controllers/produtos/list.product.dart';
import 'package:mobx/mobx.dart';
part 'product.state.g.dart';

var grupoId = 1;
var product = new ProductState();
class ProductState = _ProductStateBase with _$ProductState;

abstract class _ProductStateBase with Store {
  @observable
  ObservableList product = ObservableList();

  @observable
  ObservableList productDisplay = ObservableList();

  @action
  listarProdutos() async {
    await ListProduct().listar().then((lista) {
      product.clear();
      productDisplay.clear();
      productDisplay.addAll(lista);
      product.addAll(lista);
    });
  }
}
