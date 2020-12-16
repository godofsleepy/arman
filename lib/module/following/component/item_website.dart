import 'package:flutter/material.dart';

import 'package:arman/model/category.dart';

class ItemWebsite extends StatelessWidget {
  final SourceWeb sourceWeb;
  const ItemWebsite({
    Key key,
    this.sourceWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
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
              child: Text(sourceWeb.name)),
        ],
      ),
    );
  }
}
