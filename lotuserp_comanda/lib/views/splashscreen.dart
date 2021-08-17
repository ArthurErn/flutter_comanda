import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotuserp_comanda/main.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SplashScreen(
      seconds: 3,
      image: Image.asset('lib/assets/images/logobranco.png'),
      backgroundColor: Colors.blue[900],
      photoSize: 100,
      loaderColor: Colors.white,
      useLoader: false,
      navigateAfterSeconds: LoginPage(),
    );
  }
}
