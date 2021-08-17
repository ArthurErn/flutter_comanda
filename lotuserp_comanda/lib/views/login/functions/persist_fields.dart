import 'package:lotuserp_comanda/views/login/layout/login_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_page.dart';

bool lembrarPersist;
//SALVA OS ULTIMOS CAMPOS DE CONEXAO DA API
Future actionSalvar() async {
  String usuarioAPI = configLoginController.text;
  String senhaAPI = passController.text;
  String portaAPI = ipController.text;
  final pref = await SharedPreferences.getInstance();
  pref.setString('usuarioAPI', usuarioAPI);
  pref.setString('senhaAPI', senhaAPI);
  pref.setString('portaAPI', portaAPI);
}

//RETORNA OS ULTIMOS CAMPOS
Future buscaHost() async {
  final pref = await SharedPreferences.getInstance();
  String usuarioAPI = pref.getString("usuarioAPI");
  String senhaAPI = pref.getString("senhaAPI");
  String portaAPI = pref.getString("portaAPI");
  configLoginController.text = usuarioAPI;
  passController.text = senhaAPI;
  ipController.text = portaAPI;
}

Future salvarLogin() async {
  String usuarioLogin = loginController.text;
  final pref = await SharedPreferences.getInstance();
  pref.setString('usuario', usuarioLogin);
}

Future loadLogin() async {
  final pref = await SharedPreferences.getInstance();
  String usuarioLogin = pref.getString("usuario");
  loginController.text = usuarioLogin;
}

Future salvarCheckbox() async {
  lembrarPersist = lembrar;
  final pref = await SharedPreferences.getInstance();
  pref.setBool('lembrar', lembrarPersist);
}

Future loadCheckbox() async {
  final pref = await SharedPreferences.getInstance();
  lembrarPersist = pref.getBool('lembrar');
  lembrar = lembrarPersist != null ? lembrarPersist : false;
}
