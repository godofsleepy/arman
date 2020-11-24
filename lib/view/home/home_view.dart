import 'package:arman/helper/resource.dart';
import 'package:arman/view/detail_news/detailNews_view.dart';
import 'package:arman/view/home/component/item_category.dart';
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
        child: SafeArea(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
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
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, top: 4),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) => ItemCategory(index: index,),
              ),
            ),
            Container(
              color: ResColor.greyColor,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 50, right: 20, top: 20, left: 20),
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
