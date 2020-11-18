import 'dart:async';

import 'package:arman/helper/resource.dart';
import 'package:arman/view/component/bottom_bar.dart';
import 'package:arman/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView())));
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
                        style: TextStyle(color: ResColor.blueColor),
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
