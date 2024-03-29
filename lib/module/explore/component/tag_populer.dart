import 'package:arman/model/response_category.dart';
import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';

class TagPopuler extends StatelessWidget {
  const TagPopuler({Key key, this.index, this.topic}) : super(key: key);
  final int index;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Text(
          index.toString(),
          style: TextStyle(fontSize: 20, color: ResColor.blackColor),
        ),
        title: Text(
          topic.name,
          style: TextStyle(color: ResColor.blackColor),
        ),
        trailing: topic.has_interest == 0
            ? FlatButton.icon(
                textColor: ResColor.blueColor,
                onPressed: () {
                  // Respond to button press
                  print("alert");
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Tahap Pengembangan'),
                        content: Text(
                          'Explore Follow Masih Dalam Tahap Pengembangan',
                        ),
                        actions: [
                          FlatButton(
                            textColor: Color(0xFF6200EE),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("follow"),
              )
            : Text(
                "followed",
                style: TextStyle(
                  color: ResColor.blueColor,
                ),
              ),
      ),
    );
  }
}
