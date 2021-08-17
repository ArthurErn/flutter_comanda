import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lotuserp_comanda/controllers/connect.api.dart';
import 'package:lotuserp_comanda/models/mesas/cards.state.dart';
import 'package:lotuserp_comanda/views/login/login_page.dart';
import 'package:lotuserp_comanda/views/mesas/extrato.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            child: CustomPaint(
              painter: ShapesPainter(),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: heightSize - 149,
                child: Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.9,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: cards.cards.length,
                        itemBuilder: (BuildContext context, int index) =>
                            listaMesas(index)),
                  );
                }),
              ),
              Container(
                height: 60,
                width: widthSize,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(top: BorderSide(width: 1, color: Colors.black))),
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
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
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
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
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
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
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
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
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
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
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
        ]),
      ),
    );
  }

  listaMesas(index) {
    return Padding(
      padding: const EdgeInsets.all(3),
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
                    width: 103,
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
                                  ? "http://$ip/contextmobile/findimagem?tipo=0&escala=200&img=Mesa_Livre.PNG"
                                  : cards.cards[index].statusNome == "OCUPADA(O)"
                                      ? "http://$ip/contextmobile/findimagem?tipo=0&escala=200&img=Mesa_Ocupada.PNG"
                                      : cards.cards[index].statusNome == "CONTA"
                                          ? "http://$ip/contextmobile/findimagem?tipo=0&escala=200&img=Mesa_Conta.PNG"
                                          : "http://$ip/contextmobile/findimagem?tipo=0&escala=200&img=Mesa_Reservada.PNG",
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
                                style: TextStyle(fontSize: 9)),
                            Text(
                                cards.cards[index].reservaHora != null
                                    ? cards.cards[index].reservaHora.toString()
                                    : "",
                                style: TextStyle(fontSize: 9))
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
                    width: 163,
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

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.transparent;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.blue[900].withOpacity(.4);
    //Color.fromRGBO(194, 235, 46, .8);
    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
    /* // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 75.0, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
