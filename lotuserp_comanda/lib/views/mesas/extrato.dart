import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:intl/intl.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/mesas/extrato.state.dart';
import 'package:ifood_flutter_clone/views/content/content_page.dart';
import 'package:ifood_flutter_clone/views/login/login_page.dart';

final formatoValores = NumberFormat.currency(locale: "pt_BR", symbol: "");

class ExtratoPage extends StatefulWidget {
  const ExtratoPage({Key key}) : super(key: key);

  @override
  _ExtratoPageState createState() => _ExtratoPageState();
}

class _ExtratoPageState extends State<ExtratoPage> {
  @override
  void initState() {
    extrato.listarExtrato();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContentPage()));
          },
          label: Text('Adicionar produto'),
          icon: Icon(Icons.add_circle_outline),
          backgroundColor: Colors.blue[900],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Pedido",
              style: TextStyle(color: Colors.black, fontSize: 22)),
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return Container(
                height: MediaQuery.of(context).size.height - 165,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: extrato.extrato.length != null
                        ? extrato.extrato.length
                        : 0,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (extrato.extrato.length != null) {
                        return listExtrato(index, context);
                      } else {
                        return Center();
                      }
                    }),
              );
            }),
            Observer(builder: (_) {
              return Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text("TOTAL: ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(extrato.formatado,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ));
            })
          ],
        ));
  }

  listExtrato(index, context) {
    var basicAuth = 'Basic ' +
        base64Encode(utf8
            .encode('${passController.text}:${configLoginController.text}'));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[800],
                backgroundImage: NetworkImage(
                    'http://$ip/find-image?pTipo=1&pId=2&pEscala=500&pFileName=PRO_${formatter.format(extrato.extrato[index].idProduto)}_001.PNG',
                    headers: <String, String>{'authorization': basicAuth}),
                radius: 35,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    extrato.extrato[index].produtoNome.length == null
                        ? ""
                        : extrato.extrato[index].produtoNome.length > 32
                            ? extrato.extrato[index].produtoNome
                                .toString()
                                .substring(0, 31)
                            : extrato.extrato[index].produtoNome,
                    style: AppTypography.restaurantTitle(context),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        formatoValores
                            .format(extrato.extrato[index].vlrVendido)
                            .toString(),
                        style:
                            AppTypography.restaurantDetails(context).copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(" x "),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        extrato.extrato[index].qtde.toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        extrato.extrato[index].produtoComplemento.length == null
                            ? ""
                            : extrato.extrato[index].produtoComplemento,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
