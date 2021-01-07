import 'package:arman/model/news.dart';
import 'package:flutter/material.dart';

class ItemBookmark extends StatelessWidget {
  final News news;

  const ItemBookmark({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 140,
      height: 180,
      margin: EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: news.thumbnail != null
                ? Image.network(
                    news.source,
                    width: 140,
                    height: 180,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/no_thumbnail.jpeg",
                    width: 140,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                maxLines: 3,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
