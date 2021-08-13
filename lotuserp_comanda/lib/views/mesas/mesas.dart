import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/mesas/cards.state.dart';
import 'package:ifood_flutter_clone/views/login/login_page.dart';
import 'package:ifood_flutter_clone/views/mesas/extrato.dart';

var indice;

class MesasPage extends StatefulWidget {
  const MesasPage({Key key}) : super(key: key);

  @override
  _MesasPageState createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
  var statusMesa = 9;
  var basicAuth = 'Basic ' +
      base64Encode(
          utf8.encode('${passController.text}:${configLoginController.text}'));

  @override
  void initState() {
    cards.listarCards(statusMesa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        toolbarHeight: 65,
        title: Image.asset('lib/assets/images/logobranco.png',
            height: 60, width: 180),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: heightSize - 163,
            child: Observer(builder: (_) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.7,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: cards.cards.length,
                  itemBuilder: (BuildContext context, int index) =>
                      listaMesas(index));
            }),
          ),
          Container(
            height: 60,
            width: widthSize,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 1, color: Colors.black))),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          statusMesa = 9;
                          cards.listarCards(statusMesa);
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                              child: Text(
                            "TODOS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                wordSpacing: 1),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          statusMesa = 0;
                          cards.listarCards(statusMesa);
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.green[600],
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                              child: Text(
                            "LIVRE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                wordSpacing: 1),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          statusMesa = 1;
                          cards.listarCards(statusMesa);
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.red[700],
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                              child: Text(
                            "OCUPADAS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                wordSpacing: 1),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          statusMesa = 2;
                          cards.listarCards(statusMesa);
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                              child: Text(
                            "CONTA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                wordSpacing: 1),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          statusMesa = 4;
                          cards.listarCards(statusMesa);
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.teal[400],
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Center(
                              child: Text(
                            "RESERVADAS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                wordSpacing: 1),
                          )),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  listaMesas(index) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              indice = 0;
              indice = index;
            });

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExtratoPage()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(
                            left: BorderSide(width: 1, color: Colors.black),
                            top: BorderSide(width: 1, color: Colors.black),
                            bottom: BorderSide(width: 1, color: Colors.black))),
                    child: Center(
                        child: Text(
                      cards.cards[index].id.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Row(
                      children: [
                        Image(
                          height: 45,
                          width: 35,
                          alignment: Alignment.centerLeft,
                          image: NetworkImage(
                              cards.cards[index].statusNome == "LIVRE"
                                  ? "http://$ip/find-image?pTipo=0&pId=&pEscala=50&pFileName=Mesa_Livre.PNG"
                                  : cards.cards[index].statusNome == "OCUPADA(O)"
                                      ? "http://$ip/find-image?pTipo=0&pId=&pEscala=50&pFileName=Mesa_Ocupada.PNG"
                                      : cards.cards[index].statusNome == "CONTA"
                                          ? "http://$ip/find-image?pTipo=0&pId=&pEscala=50&pFileName=Mesa_Conta.PNG"
                                          : "http://$ip/find-image?pTipo=0&pId=&pEscala=50&pFileName=Mesa_Reservada.PNG",
                              headers: <String, String>{
                                'authorization': basicAuth
                              }),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                                cards.cards[index].abData != null
                                    ? cards.cards[index].abData
                                        .toString()
                                        .substring(0, 10)
                                    : "",
                                style: TextStyle(fontSize: 10)),
                            Text(
                                cards.cards[index].reservaHora != null
                                    ? cards.cards[index].reservaHora.toString()
                                    : "",
                                style: TextStyle(fontSize: 10))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 160,
                    height: 30,
                    decoration: BoxDecoration(
                        color: cards.cards[index].statusNome == 'LIVRE'
                            ? Colors.green[600]
                            : cards.cards[index].statusNome == 'OCUPADA(O)'
                                ? Colors.red[700]
                                : cards.cards[index].statusNome == 'CONTA'
                                    ? Colors.amber
                                    : Colors.teal[400],
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.black),
                            left: BorderSide(width: 1, color: Colors.black),
                            right: BorderSide(width: 1, color: Colors.black))),
                    child: Center(
                        child: Text(cards.cards[index].statusNome,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
