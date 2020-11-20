import 'package:flutter/material.dart';

class ItemBookmark extends StatefulWidget {
  ItemBookmark({Key key}) : super(key: key);

  @override
  _ItemBookmarkState createState() => _ItemBookmarkState();
}

class _ItemBookmarkState extends State<ItemBookmark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 140,
      height: 180,
      margin: EdgeInsets.only(right: 18),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://cached.imagescaler.hbpl.co.uk/resize/scaleHeight/815/cached.offlinehbpl.hbpl.co.uk/news/OMC/NikeMuslim-20180124014618716.jpg",
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
                "Nike Jual sport hijjab selama ini nike yang dikenal hanya membuat peralatan ",
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
