import 'package:arman/utils/utils.dart';
import 'package:arman/module/explore/component/tag_populer.dart';
import 'package:arman/module/home/component/item_news.dart';
import 'package:arman/module/module.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  ExploreView({Key key}) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchView()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search islamic vibes",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: ResColor.blueColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Populer",
                    style: TextStyle(
                        fontSize: 18,
                        color: ResColor.blackColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        TagPopuler(index: index + 1),
                  ),
                ),
                Divider(
                  height: 40,
                  thickness: 2,
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30),
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ItemNews(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
