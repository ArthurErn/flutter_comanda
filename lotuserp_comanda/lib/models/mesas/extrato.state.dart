import 'package:ifood_flutter_clone/controllers/mesas/list.extrato.dart';
import 'package:ifood_flutter_clone/models/mesas/cards.state.dart';
import 'package:ifood_flutter_clone/models/mesas/extrato.model.dart';
import 'package:ifood_flutter_clone/models/produtos/complemento.state.dart';
import 'package:ifood_flutter_clone/views/mesas/extrato.dart';
import 'package:mobx/mobx.dart';
part 'extrato.state.g.dart';

var extrato = new ExtratoState();

class ExtratoState = _ExtratoStateBase with _$ExtratoState;

abstract class _ExtratoStateBase with Store {
  @observable
  ObservableList<ExtratoMesaModel> extrato = ObservableList();

  @observable
  String formatado = "";

  double valorTotal = 0.0;

  @action
  listarExtrato() async {
    await ListExtrato().listar().then((lista) {
      extrato.clear();
      extrato.addAll(lista);
      calcularTotal();
    });
  }

  @action
  String calcularTotal() {
    var aux = 0;
    valorTotal = 0;
    // ignore: unused_local_variable
    for (var item in extrato) {
      valorTotal = valorTotal + (extrato[aux].vlrLiquido);
      aux++;
    }
    formatado = formatoValores.format(valorTotal).toString();
    return formatado;
  }

  @action
  postarExtrato() async {
    complementos.calcularComplemento();
    await ListExtrato().postarExtrato().then((value) async {
      await cards.listarCards(9).then((value) {
        listarExtrato();
      });
    });
  }
}
