import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class DetailNewsView extends StatefulWidget {
  DetailNewsView({Key key}) : super(key: key);

  @override
  _DetailNewsViewState createState() => _DetailNewsViewState();
}

class _DetailNewsViewState extends State<DetailNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(top: 4, right: 20, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 26,
                  color: ResColor.blackColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton.icon(
                textColor: ResColor.blueColor,
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.bookmark_outline, size: 26),
                label: Text("Bookmark"),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://cached.imagescaler.hbpl.co.uk/resize/scaleHeight/815/cached.offlinehbpl.hbpl.co.uk/news/OMC/NikeMuslim-20180124014618716.jpg",
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
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
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "- 3 jam yang lalu",
                      style: TextStyle(
                          color: ResColor.blueColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
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
                  ResColor.desription,
                  style: TextStyle(color: ResColor.blackColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      textColor: ResColor.redColor,
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: Icon(Icons.favorite, size: 30),
                      label: Text("2300 likes"),
                    ),
                    FlatButton.icon(
                      textColor: ResColor.blueColor,
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: Icon(Icons.share, size: 30),
                      label: Text("share"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
