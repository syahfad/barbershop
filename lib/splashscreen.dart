import 'dart:async';
import 'package:barbershop/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  _SplashScreen createState()=> _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Start()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                'images/logo.png',
            ),
          ],
        ),
      ),
    );
  }
}