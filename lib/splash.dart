import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:Color.fromRGBO(24, 30, 115, 1.0),
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/LOGO1.png'),
            SizedBox(height: 20),
            //SizedBox(width: ,)
          ],
        ),
      ),
    ),
  );
}
}