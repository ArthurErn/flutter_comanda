import '../login_page.dart';

int tipoOsv;
//PEGAR O INDEX DA EMPRESA SELECIONADA
getIndex(index) {
  val = item.indexOf(selecionado);
  return val;
}

//PEGA OS PRIMEIROS 5 DIGITOS DA EMPRESA, PRA JOGAR NA ROTA DA API
getIndexEmpresa(index) {
  int valInt = item.indexOf(selecionado);
  if (valInt == -1) {
    valInt = 1;
    return val;
  } else {
    String val = item[valInt].id.toString();
    String valReg = val.substring(0);
    return valReg;
  }
}
