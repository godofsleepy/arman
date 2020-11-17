import 'package:arman/helper/resource.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(top: 4, right: 20, left: 20, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 40,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Arman",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ResColor.greenColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              IconButton(
                iconSize: 34,
                icon: Icon(
                  Icons.search,
                  color: ResColor.blackColor,
                ),
                onPressed: () {
                  return Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: ResColor.greyColor,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child:       Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.white),
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
                        ))
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
