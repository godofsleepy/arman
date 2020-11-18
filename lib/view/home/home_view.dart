import 'package:arman/helper/resource.dart';
import 'package:arman/view/detail_news/detail_news.dart';
import 'package:arman/view/home/component/item_news.dart';
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
      body: Column(
        children: [
          Container(
            height: 104,
            child: ListView(
              padding: EdgeInsets.only(left: 25, top: 16),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Material(
                          color: ResColor.greenColor, // button color
                          child: InkWell(
                            splashColor: ResColor.blueColor, // inkwell color
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ResColor.greyColor,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNews()));
                    },
                    child: ItemNews(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
