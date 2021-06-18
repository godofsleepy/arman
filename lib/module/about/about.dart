import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "INTERNSHIP PROJECT RIFAT KHADAFY AT RUMAH CODING.\nrifat.khadafy@gmail.com",
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "back",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Spacer(),
              Text(
                "BUILD WITH FLUTTER,  DEV.VERSION",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
