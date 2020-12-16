// import 'package:arman/test.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ResColor.darkGreenColor, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arman',
      theme: ThemeData(
        appBarTheme: AppBarTheme(brightness: Brightness.light),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: SplashView(),
    );
  }
}
