import 'package:lotuserp_comanda/controllers/produtos/list.complemento.dart';
import 'package:lotuserp_comanda/models/produtos/complemento.model.dart';
import 'package:lotuserp_comanda/models/produtos/pizza.state.dart';
import 'package:lotuserp_comanda/models/produtos/product.state.dart';
import 'package:lotuserp_comanda/views/content/content_page.dart';
import 'package:lotuserp_comanda/views/mesas/complemento.dart';
import 'package:lotuserp_comanda/views/mesas/quantidade.dart';
import 'package:mobx/mobx.dart';
part 'complemento.state.g.dart';

var complementos = new ComplementoState();
var maiorValor = 0.0;
class ComplementoState = _ComplementoStateBase with _$ComplementoState;

abstract class _ComplementoStateBase with Store {
  @observable
  ObservableList<ComplementoModel> complementos = new ObservableList();

  @observable
  ObservableList<ComplementoModel> complementosDisplay = new ObservableList();

  @observable
  ObservableList<ComplementoModel> complementosSelecionados =
      new ObservableList();

  @observable
  dynamic valorComplemento = 0.0;

  @action
  listarComplementos() async {
    await ListComplemento().listar().then((lista) {
      complementos.clear();
      complementosDisplay.clear();
      complementosDisplay = lista;
      complementos = lista;
    });
  }

  @action
  calcularComplemento() {
    var aux = 0;
    valorComplemento = 0.0;

    if (product.product[indiceProduto].produtoPizza == 0) {
      // ignore: unused_local_variable
      for (var item in complementosSelecionados) {
        if (aux == 0 && complementosSelecionados.length != 0) {
          aux = complementosSelecionados[aux].complementosQtdeMaxima;
        }
        if (complementosSelecionados.length >
            complementosSelecionados[0].complementosQtdeMaxima) {
          if (complementosSelecionados[aux].complementosQtdeMaxima > 0) {
            valorComplemento = valorComplemento +
                (complementosSelecionados[aux].valor *
                    int.parse(quantityController.text));
          }
        }
        if (aux == complementosSelecionados.length - 1) {
          return valorComplemento.toString();
        }
        aux++;
      }
    } else if (product.product[indiceProduto].produtoPizza == 1) {
      // ignore: unused_local_variable
      valorComplemento = pequena == true
          ? product.product[indiceProduto].valorTamPequeno
          : media == true
              ? product.product[indiceProduto].valorTamMedio
              : grande == true
                  ? product.product[indiceProduto].valorTamGrande
                  : 
                      product.product[indiceProduto].valorTamFamilia;
      // ignore: unused_local_variable
      for (var item in pizza.pizzaSelecionada) {
        var pvenda = pequena == true
            ? pizza.pizzaSelecionada[aux].valorTamPequeno
            : media == true
                ? pizza.pizzaSelecionada[aux].valorTamMedio
                : grande == true
                    ? pizza.pizzaSelecionada[aux].valorTamGrande
                    : pizza.pizzaSelecionada[aux].valorTamFamilia;
        if (pvenda > valorComplemento) {
          valorComplemento = pvenda;
        }
        aux++;
      }
      return valorComplemento.toString();
    }
  }

  @action
  adicionarComplementos() async {
    ComplementoModel model = ComplementoModel(
      idGrupo: complementos[indiceComplemento].idGrupo,
      complementosQtdeMaxima:
          complementos[indiceComplemento].complementosQtdeMaxima,
      item: complementos[indiceComplemento].item,
      nomeComplemento: complementos[indiceComplemento].nomeComplemento,
      valor: complementos[indiceComplemento].valor,
      status: complementos[indiceComplemento].status,
    );
    complementosSelecionados.add(model);
  }
}
