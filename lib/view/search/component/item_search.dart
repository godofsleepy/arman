import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  const ItemSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            "https://images.unsplash.com/photo-1509585585779-17594514ad43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
        ),
        title: Text(
          "Papa green",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          "Muslim.co.id",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
