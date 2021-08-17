import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotuserp_comanda/views/login/functions/index_api.dart';
import 'package:lotuserp_comanda/views/login/login_page.dart';

var empresaId = getIndexEmpresa(val);
var ip = ipController.text;

class ConnectApi {
  var _usuario = configLoginController.text;
  var _senha = passController.text;

  Future inicializar(String uri) async {
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$_usuario:$_senha'));
    var url = Uri.parse(uri);
    try {
      var response = await http
          .get(url, headers: <String, String>{'authorization': basicAuth});
      return response;
    } catch (e) {
      return throw Exception("Status Code != 200");
    }
  }

  Future postar(String uri, jsonData) async {
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$_usuario:$_senha'));
    var url = Uri.parse(uri);

    try {
      // ignore: unused_local_variable
      var data = await http
          .post(
        url,
        headers: <String, String>{'authorization': basicAuth},
        body: jsonData,
      )
          .then((value) {
        print(value.body);
        return "sucess";
      });
    } catch (e) {
      return throw Exception("Status Code != 200");
    }
  }
}
