import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifood_flutter_clone/controllers/login/login_auth.dart';
import 'package:ifood_flutter_clone/models/login/construtor_empresa.dart';
import 'package:ifood_flutter_clone/views/login/functions/persist_fields.dart';
import 'package:ifood_flutter_clone/views/login/layout/api_field.dart';
import 'package:ifood_flutter_clone/views/login/layout/login_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

//LOGIN
var loginController = TextEditingController();
var loginControllerText = loginController.text;
var passLogController = TextEditingController();
var passLogControllerText = passLogController.text;
var persistEmpresa;

//API
var ipController = TextEditingController();
String ipControllerText = ipController.text;
var configLoginController = TextEditingController();
String configLoginControllerText = configLoginController.text;
var passController = TextEditingController();
String passControllerText = passController.text;

//EMPRESAS
List<String> items = [];
List<LoginEmpresa> item = [];

//INDEXES
var selecionado;
int val;

//TROCAR ENTRE LOGIN E CONEXAO API
bool isLoading = false;
bool isLogin = true;
bool isPassword = false;

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  void initState() {
    setState(() {
      lembrarPersist = false;
      lembrar = false;
    });

    loadCheckbox().then((value) {
      if (lembrar == true) {
        loadLogin();
      }
    });

    super.initState();
    buscaHost().then((value) {
      AuthenticationEmpresas().fetchAll().then((lista) {
        setState(() {
          //items = lista;

          item = lista;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: AssetImage(
            'lib/assets/images/background.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.blue[100].withOpacity(0.1),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/logo_azul.png"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .20,
                      left: MediaQuery.of(context).size.width * .07),
                  //color: Colors.blue[800].withOpacity(0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildBottomHalfContainer(true),
            Positioned(
                top: MediaQuery.of(context).size.height / 3.1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isLogin
                                              ? Colors.grey[800]
                                              : Colors.grey[400]),
                                    ),
                                    if (isLogin)
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        height: 2,
                                        width: 55,
                                        color: Colors.yellow[700],
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'CONECTAR',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isLogin
                                          ? Colors.grey[400]
                                          : Colors.grey[800]),
                                ),
                                if (!isLogin)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 60,
                                    color: Colors.yellow[700],
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (!isLogin) ApiField(),
                      if (isLogin) LoginField(),
                      if (isLogin)
                        Container(
                          child: Row(
                            children: [
                              Checkbox(
                                  value: lembrar,
                                  onChanged: (bool valor) {
                                    setState(() {
                                      lembrar = valor;
                                      salvarCheckbox();
                                    });
                                  }),
                              Text(
                                "Lembrar usuário?",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                )),
            buildBottomHalfContainer(false),
            Positioned(
                top: MediaQuery.of(context).size.height - 20,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(
                      "www.vistatecnologia.com.br",
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Positioned buildBottomHalfContainer(bool showShadow) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 1.20,
        right: 0,
        left: 0,
        child: Center(
            child: Container(
          height: 70,
          width: 260,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                      color: Colors.black.withOpacity(0.0),
                      blurRadius: 0,
                      spreadRadius: 0)
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.yellow[700], Colors.yellow[600]],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(14)),
                  child: InkWell(
                    child: Center(
                      child: !isLoading
                          ? Text(
                              !isLogin ? 'CONECTAR' : 'LOGAR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          : JumpingText(
                              'CARREGANDO...',
                              style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                            ),
                    ),
                    onTap: () {
                      setState(() {
                        if (isLogin == true) {
                          setState(() {
                            isLoading = true;
                            AuthenticationLogin().fetch(context).then((value) {
                                Future.delayed(Duration(milliseconds: 2600))
                                    .then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      
                                    });
                                
                            });
                            AuthenticationLogin().getUsuario();
                            if (lembrar == true) {
                              salvarLogin();
                            }
                          });
                        } else {
                          setState(() {
                            AuthenticationEmpresas().getStatus(context);
                            actionSalvar();
                            isLogin = true;
                            selecionado = null;
                            AuthenticationEmpresas().fetchAll().then((lista) {
                              setState(() {
                                //items = lista;
                                item = lista;
                              });
                            });
                          });
                        }
                      });
                    },
                  ),
                )
              : Center(),
        )));
  }
}
