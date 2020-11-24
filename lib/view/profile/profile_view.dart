import 'package:arman/helper/resource.dart';
import 'package:arman/view/profile/component/item_bookmark.dart';
import 'package:arman/view/profile/component/more_sheet.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: SizedBox.expand(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: FittedBox(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: 2,
                        right: 2,
                        bottom: 65),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, -3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Rifat Khadafy",
                                style: TextStyle(
                                    color: ResColor.blackColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "khadafy67@gmail.com",
                                style: TextStyle(
                                  color: ResColor.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ResColor.whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 50,
                                padding: EdgeInsets.only(
                                    top: 8, right: 16, left: 16, bottom: 8),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.history),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "History",
                                          style: TextStyle(
                                              color: ResColor.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ResColor.whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 50,
                                padding: EdgeInsets.only(
                                    top: 8, right: 16, left: 16, bottom: 8),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite_outline),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Liked",
                                          style: TextStyle(
                                              color: ResColor.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              ),
                              Divider(
                                height: 35,
                                thickness: 1.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bookmark",
                                    style: TextStyle(
                                      color: ResColor.blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 180,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          ItemBookmark(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 115,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1509585585779-17594514ad43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 175,
                    right: 15,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: ResColor.blueColor,
                                size: 26,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return MoreSheet();
                                  },
                                  context: context,
                                );
                              },
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
