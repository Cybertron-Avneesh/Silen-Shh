import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Stack(
        children: [
          new Center(
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[100],
                    radius: 125,
                    child: Center(
                      child: new Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
             Align(
                alignment: Alignment.bottomCenter,
                child: Text("Version 1.0")),
        ],
      ),
    );
  }
}
