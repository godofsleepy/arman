import 'package:arman/utils/resource.dart';
import 'package:arman/view/following/component/item_website.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class FollowingView extends StatefulWidget {
  FollowingView({Key key}) : super(key: key);

  @override
  _FollowingViewState createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  List<String> tags = [];
  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Website",
                    style: TextStyle(
                        fontSize: 18,
                        color: ResColor.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        ItemWebsite(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Topik",
                    style: TextStyle(
                        fontSize: 18,
                        color: ResColor.blackColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ChipsChoice<String>.multiple(
                  value: tags,
                  wrapped: true,
                  onChanged: (val) => setState(() => tags = val),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: options,
                    value: (i, v) => v,
                    label: (i, v) => v,
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
