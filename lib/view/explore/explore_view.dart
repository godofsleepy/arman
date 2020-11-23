import 'package:arman/helper/resource.dart';
import 'package:arman/view/explore/component/tag_populer.dart';
import 'package:arman/view/home/component/item_news.dart';
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
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
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
                    // TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     labelText: 'Search',
                    //     prefixIcon: Icon(Icons.search),
                    //   ),
                    // ),
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
                    padding: EdgeInsets.only(bottom: 10),
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
