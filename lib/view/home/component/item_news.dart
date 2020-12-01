import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';

class ItemNews extends StatefulWidget {
  ItemNews({Key key}) : super(key: key);

  @override
  _ItemNewsState createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://yt3.ggpht.com/a/AATXAJw-qO5-_fvlpv_GxqNA1pEGN8_Np7sHm6HB3FYSCw=s900-c-k-c0x00ffffff-no-rj",
                        width: 30,
                      ),
                    ),
                    Text(
                      "Muslim.or.id",
                      style: TextStyle(
                          color: ResColor.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ResColor.blueColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Text(
              "Nike beggins selling hijab",
              style: TextStyle(
                  color: ResColor.blackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "3 jam yang lalu",
              style: TextStyle(
                  color: ResColor.blueColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 13),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://cached.imagescaler.hbpl.co.uk/resize/scaleHeight/815/cached.offlinehbpl.hbpl.co.uk/news/OMC/NikeMuslim-20180124014618716.jpg",
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
