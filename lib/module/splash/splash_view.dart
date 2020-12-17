import 'dart:async';
import 'package:arman/module/module.dart';
import 'package:arman/utils/resource.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user = prefs.getString('user');
      if (user != null) {
        setState(() {
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomBar())));
        });
      } else {
        setState(() {
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginView())));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png"),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Arman",
                        style: TextStyle(
                          color: ResColor.greenColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Artike muslim penuh manfaat",
                        style:
                            TextStyle(color: ResColor.blueColor, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
