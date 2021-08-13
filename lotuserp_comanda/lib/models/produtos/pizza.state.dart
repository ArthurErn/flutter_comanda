import 'package:ifood_flutter_clone/controllers/produtos/list.pizza.dart';
import 'package:ifood_flutter_clone/models/produtos/pizza.model.dart';
import 'package:ifood_flutter_clone/views/mesas/complemento.dart';
import 'package:mobx/mobx.dart';
part 'pizza.state.g.dart';

var pizza = PizzaState();

class PizzaState = _PizzaStateBase with _$PizzaState;

abstract class _PizzaStateBase with Store {
  @observable
  ObservableList<PizzaModel> pizzas = new ObservableList<PizzaModel>();
  
   @observable
  ObservableList<PizzaModel> pizzaSelecionada = new ObservableList<PizzaModel>();

  @action
  listarPizzas() async {
    await ListPizza().listar().then((lista) {
      pizzas.clear();
      pizzas = lista;
    });
  }

  @action
  adicionarPizza() async {
    PizzaModel _pizza = PizzaModel(
      idEmpresa: pizza.pizzas[indicePizza].idEmpresa,
      idProduto: pizza.pizzas[indicePizza].idProduto,
      produtoDescricao: pizza.pizzas[indicePizza].produtoDescricao,
      pvenda: pizza.pizzas[indicePizza].pvenda,
      valorTamPequeno: pizza.pizzas[indicePizza].valorTamPequeno,
      valorTamMedio: pizza.pizzas[indicePizza].valorTamMedio,
      valorTamGrande: pizza.pizzas[indicePizza].valorTamGrande,
      valorTamFamilia: pizza.pizzas[indicePizza].valorTamFamilia
    );
    pizzaSelecionada.add(_pizza);
  }
}
