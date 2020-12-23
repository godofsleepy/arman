import 'package:arman/model/news.dart';
import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  final News itemRecommendation;
  const ItemSearch({Key key, this.itemRecommendation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: itemRecommendation.thumbnail != null
              ? Image.network(
                  itemRecommendation.thumbnail,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                )
              : Image.asset(
                  "assets/no_thumbnail.jpeg",
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
        ),
        title: Text(
          itemRecommendation.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          itemRecommendation.source,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
