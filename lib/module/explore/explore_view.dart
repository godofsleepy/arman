import 'dart:math';

import 'package:arman/module/explore/exploreNews_bloc.dart';
import 'package:arman/module/explore/exploretopic_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/explore/component/tag_populer.dart';
import 'package:arman/module/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ExploreView extends StatefulWidget {
  ExploreView({Key key}) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  ExploreNewsBloc exploreNewsBloc = ExploreNewsBloc();
  ExploreTopicBloc exploreTopicBloc = ExploreTopicBloc();
  var random = Random();

  @override
  void initState() {
    exploreNewsBloc..add(ExploreNewsEvent());
    exploreTopicBloc..add(ExploreTopicEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ExploreTopicBloc>(
            create: (context) => exploreTopicBloc,
          ),
          BlocProvider<ExploreNewsBloc>(
            create: (context) => exploreNewsBloc,
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchView()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          right: 16, left: 16, top: 8, bottom: 8),
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
                    child: BlocBuilder<ExploreTopicBloc, ExploreTopicState>(
                      builder: (context, state) {
                        if (state.status == ExploreTopicStatus.success) {
                          return ListView.builder(
                            padding: EdgeInsets.only(bottom: 20),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) =>
                                TagPopuler(index: index + 1, topic: state.data[random.nextInt(16)],),
                          );
                        } else {
                          return Shimmer.fromColors(
                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 20),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  index++;
                                  return Container(
                                    child: ListTile(
                                        leading: Text(
                                          index.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: ResColor.blackColor),
                                        ),
                                        title: Material(
                                          color: ResColor.greyColor,
                                          child: SizedBox(
                                            height: 2,
                                            width: 2,
                                          ),
                                        ),
                                        trailing: Material(
                                          color: ResColor.greyColor,
                                          child: SizedBox(
                                            height: 2,
                                            width: 2,
                                          ),
                                        )),
                                  );
                                }),
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            enabled: true,
                          );
                        }
                      },
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  BlocBuilder<ExploreNewsBloc, ExploreNewsState>(
                    builder: (context, state) {
                      if (state.status == ExploreNewsStatus.success) {
                        return Container(
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 30),
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ItemNews(
                              item: state.data[index],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 6),
                          child: CircularLoading(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
