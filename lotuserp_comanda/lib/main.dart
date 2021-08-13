import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/controllers/login/login_auth.dart';
import 'package:ifood_flutter_clone/views/login/functions/persist_fields.dart';
import 'package:ifood_flutter_clone/views/login/layout/login_dropdown.dart';
import 'package:ifood_flutter_clone/views/login/layout/login_field.dart';
import 'package:ifood_flutter_clone/views/login/login_page.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 50;

  double _loginWidth = 0;
  double _loginHeight = 0;
  // ignore: unused_field
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
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
          item = lista;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 40;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Colors.blue[900].withOpacity(0.8);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Colors.blue[900];
        _headingColor = Colors.white;

        _headingTop = 55;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 250;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "LOTUS ERP",
                                style: TextStyle(
                                    letterSpacing: 2,
                                    color: _headingColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Comanda Eletrônica",
                                style: TextStyle(
                                    color: _headingColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "We make learning easy. Join Tvac Studio to learn flutter for free on YouTube.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: _headingColor, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset(
                      "lib/assets/images/waiter4.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(36),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              letterSpacing: 1.5,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        AnimatedContainer(
          padding: EdgeInsets.only(top: 0, right: 32, left: 32, bottom: 32),
          width: _loginWidth,
          height: _loginHeight + 50,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      _pageState != 2 ? "Faça login para continuar" : "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        border: Border.all(
                            color: Colors.grey[400].withOpacity(0.8),
                            width: 2)),
                    child: DropdownButtonHideUnderline(child: Dropdown()),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputWithIcon(
                    icon: Icons.person_outline,
                    hint: "Usuário",
                    obscure: false,
                    controller: loginController,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputWithIcon(
                      icon: Icons.lock_outlined,
                      obscure: true,
                      hint: "Senha",
                      controller: passLogController)
                ],
              ),
              //itemsSizedBox(height: 5),
              Column(
                children: <Widget>[
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
                  ),
                  GestureDetector(
                    onTap: () {
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
                    },
                    child: PrimaryButton(
                      btnText: "FAZER LOGIN",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "CONECTAR NA API",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Conexão da API",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.meeting_room_outlined,
                    hint: "IP/Porta",
                    controller: ipController,
                    obscure: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InputWithIcon(
                    icon: Icons.admin_panel_settings,
                    hint: "Usuário",
                    controller: configLoginController,
                    obscure: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InputWithIcon(
                    icon: Icons.lock_open,
                    hint: "Senha",
                    controller: passController,
                    obscure: true,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                        setState(() {
                          setState(() {
                            actionSalvar();
                            selecionado = null;
                            item.clear();
                          });

                          AuthenticationEmpresas().fetchAll().then((lista) {
                            setState(() {
                              item = lista;
                            });
                          });
                        });
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Conectar e voltar",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  InputWithIcon(
      {this.icon, this.hint, @required this.controller, this.obscure});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Expanded(
            child: TextField(
              obscureText: widget.obscure,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: InputBorder.none,
                  hintText: widget.hint),
            ),
          )
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[900], borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[900], width: 2),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(14),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
