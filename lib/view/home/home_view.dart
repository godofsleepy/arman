import 'package:arman/helper/resource.dart';
import 'package:arman/view/detail_news/detailNews_view.dart';
import 'package:arman/view/home/component/item_news.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 4),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              child: ListView(
                padding: EdgeInsets.only(left: 16, top: 4),
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
                                  width: 35,
                                  height: 35,
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Trending",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: ResColor.greyColor,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNewsView()));
                    },
                    child: ItemNews(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
