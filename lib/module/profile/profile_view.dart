import 'package:arman/module/module.dart';
import 'package:arman/module/profile/profile_bloc.dart';
import 'package:arman/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/item_bookmark.dart';
import 'component/more_sheet.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    profileBloc..add(ProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status == ProfileStatus.success) {
              return SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: SizedBox.expand(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: FittedBox(
                            child: Image.asset(
                              "assets/bg_profile.jpeg",
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
                                  offset: Offset(
                                      0, -3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.userAccount.name,
                                        style: TextStyle(
                                            color: ResColor.blackColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        state.userAccount.email,
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
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HistoryView())),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ResColor.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              right: 16,
                                              left: 16,
                                              bottom: 8),
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                        color:
                                                            ResColor.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LikedView()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ResColor.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              right: 16,
                                              left: 16,
                                              bottom: 8),
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                        color:
                                                            ResColor.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right)
                                            ],
                                          ),
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
                                            icon: Icon(
                                                Icons.keyboard_arrow_right),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BookmarkView()),
                                              );
                                            },
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
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
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
                                    state.userAccount.image,
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
                                          builder: (context) {
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
              );
            } else {
              return Center(
                child: Container(
                  // margin: EdgeInsets.only(
                  //     top: MediaQuery.of(context).size.height / 4),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
