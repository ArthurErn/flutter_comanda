import 'package:ifood_flutter_clone/controllers/mesas/list.cards.dart';
import 'package:ifood_flutter_clone/models/mesas/cards.model.dart';
import 'package:mobx/mobx.dart';
part 'cards.state.g.dart';

var cards = new Cards();

class Cards = _CardsBase with _$Cards;

abstract class _CardsBase with Store {
  @observable
  ObservableList<CardsModel> cards = ObservableList();

  @action
  listarCards(statusMesa) async{
    await ListCards().listar(statusMesa).then((lista) {
      cards.clear();
      cards.addAll(lista);
    });
  }
}
