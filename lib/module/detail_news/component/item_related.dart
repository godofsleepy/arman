import 'package:arman/model/detail.dart';
import 'package:flutter/material.dart';

class ItemRelated extends StatelessWidget {
  final RelatedArtic relatedArtic;

  const ItemRelated({Key key, this.relatedArtic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (relatedArtic.content_type != "Article") return Container();
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: relatedArtic.thumbnail != null
              ? Image.network(
                  relatedArtic.thumbnail,
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
          relatedArtic.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          relatedArtic.source,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
