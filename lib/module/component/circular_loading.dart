import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}
