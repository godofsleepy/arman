import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Text(
        "Warisan dalam islam",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
