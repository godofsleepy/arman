import 'package:arman/helper/resource.dart';
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
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenWidget.elementAt(selectedIndex),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: ResColor.greenColor,
        buttonBackgroundColor: ResColor.greenColor,
        backgroundColor: getColorIndex(),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Color getColorIndex() {
    switch (selectedIndex) {
      case 0:
        return ResColor.greyColor;
        break;
      case 1:
        return Colors.white;
        break;
      default:
    }
  }
}
