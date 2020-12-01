import 'package:arman/utils/resource.dart';
import 'package:arman/view/explore/explore_view.dart';
import 'package:arman/view/following/following_view.dart';
import 'package:arman/view/home/home_view.dart';
import 'package:arman/view/profile/profile_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int selectedIndex = 0;
  List<Widget> screenWidget = [
    HomeView(),
    ExploreView(),
    FollowingView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenWidget.elementAt(selectedIndex),
          Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: CurvedNavigationBar(
                  key: _bottomNavigationKey,
                  index: 0,
                  height: 50.0,
                  items: <Widget>[
                    Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.explore,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.library_add,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                  color: ResColor.greenColor,
                  buttonBackgroundColor: ResColor.greenColor,
                  backgroundColor: Colors.transparent,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 600),
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}
