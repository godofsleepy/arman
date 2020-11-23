import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class TagPopuler extends StatelessWidget {
  const TagPopuler({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        subtitle: Text(
          "Bagaimana cara salam yang baik dan benar",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Text(
          index.toString(),
          style: TextStyle(
            fontSize: 20,
            color: ResColor.blackColor
          ),
        ),
        title: Text(
          "Salam",
          style: TextStyle(color: ResColor.blackColor),
        ),
        trailing: FlatButton.icon(
          textColor: ResColor.blueColor,
          onPressed: () {
            // Respond to button press
          },
          icon: Icon(Icons.add, size: 18),
          label: Text("follow"),
        ),
      ),
    );
  }
}
