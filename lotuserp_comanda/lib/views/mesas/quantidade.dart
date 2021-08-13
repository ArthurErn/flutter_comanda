import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/product.state.dart';
import 'package:ifood_flutter_clone/views/content/content_page.dart';
import 'package:ifood_flutter_clone/views/login/login_page.dart';
import 'package:ifood_flutter_clone/views/mesas/complemento.dart';

var quantityController = TextEditingController();

class QuantidadeProdutoPage extends StatefulWidget {
  const QuantidadeProdutoPage({Key key}) : super(key: key);

  @override
  _QuantidadeProdutoPageState createState() => _QuantidadeProdutoPageState();
}

class _QuantidadeProdutoPageState extends State<QuantidadeProdutoPage> {
  var basicAuth = 'Basic ' +
      base64Encode(
          utf8.encode('${passController.text}:${configLoginController.text}'));

  @override
  void initState() {
    setState(() {
      quantityController.text = '1';
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ComplementoPage()));
        },
        label: Text('Avançar'),
        icon: Icon(Icons.add_circle_outline),
        backgroundColor: Colors.blue[900],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title:
            Text("Escolher quantidade", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 65,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Item selecionado: ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              'http://$ip/find-image?pTipo=1&pId=2&pEscala=500&pFileName=PRO_${formatter.format(product.product[indiceProduto].idProduto)}_001.PNG',
              headers: <String, String>{'authorization': basicAuth},
            ),
            radius: 95,
          ),
          Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Colors.black)),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width - 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (quantityController.text == '1') {
                              return;
                            } else {
                              setState(() {
                                var num = int.parse(quantityController.text);
                                num = num - 1;
                                quantityController.text = num.toString();
                              });
                            }
                          },
                          icon: Icon(Icons.remove)),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          width: 100,
                          child: TextField(
                            textDirection: TextDirection.ltr,
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      IconButton(
                          onPressed: () {
                            if (quantityController.text == '0') {
                              return;
                            } else {
                              setState(() {
                                var num = int.parse(quantityController.text);
                                num = num + 1;
                                quantityController.text = num.toString();
                              });
                            }
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ))),
        ],
      ),
    );
  }
}
