import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 4, right: 20, left: 20, bottom: 4),
            child: Text(
              "Arman",
              style: TextStyle(color: ResColor.greenColor, fontSize: 24),
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Ahlan wasahlan",
                  style: TextStyle(color: ResColor.greenColor, fontSize: 38),
                ),
                Text("login terlebih dahulu untuk melanjutkan.", style: TextStyle(
                  color: ResColor.blueColor,
                  fontSize: 13,
                ),)
              ],
            ),
            Container(
              child: Image.asset(
                "assets/login.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
