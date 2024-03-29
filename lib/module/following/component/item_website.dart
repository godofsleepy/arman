import 'package:arman/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:arman/model/response_category.dart';

class ItemWebsite extends StatelessWidget {
  final SourceWeb sourceWeb;
  const ItemWebsite({
    Key key,
    this.sourceWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              child: Image.network(
                sourceWeb.logo,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              sourceWeb.name,
              style: TextStyle(
                color: sourceWeb.has_interest == 1
                    ? ResColor.blueColor
                    : ResColor.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
