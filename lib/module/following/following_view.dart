import 'package:arman/module/following/following_bloc.dart';
import 'package:arman/utils/utils.dart';
import 'package:arman/module/following/component/item_website.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingView extends StatefulWidget {
  FollowingView({Key key}) : super(key: key);

  @override
  _FollowingViewState createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  FollowingBloc followingBloc = FollowingBloc();

  @override
  void initState() {
    super.initState();
    followingBloc..add(FollowingEvent());
  }

  List<String> tags = [];
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => followingBloc,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 50, top: 20, left: 20, right: 20),
              child: BlocBuilder<FollowingBloc, FollowingState>(
                builder: (context, state) {
                  if (state.status == FollowingStatus.success) {
                    // state.tags.forEach((element) {
                    //   tags.add(element.toString());
                    // });
                    if (a == 0) {
                      tags..addAll(state.tags);
                      a += 1;
                    }
                    return Column(
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
                          height: 350,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 9,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                              onTap: () {
                                if (state.dataWeb[index].has_interest == 1) {
                                  followingBloc.add(FollowingEventUnfollow(
                                      type: "sources",
                                      id: state.dataWeb[index].id.toString()));
                                  setState(() {
                                    state.dataWeb[index].has_interest = 0;
                                  });
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Tahap Pengembangan'),
                                        content: Text(
                                          'Unfollow Content Web Dan Topik Masih Dalam Tahap Pengembangan',
                                        ),
                                        actions: [
                                          FlatButton(
                                            textColor: Color(0xFF6200EE),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  followingBloc.add(FollowingEventFollow(
                                      type: "sources",
                                      id: state.dataWeb[index].id.toString()));
                                  setState(() {
                                    state.dataWeb[index].has_interest = 1;
                                  });
                                }
                              },
                              child: ItemWebsite(
                                sourceWeb: state.dataWeb[index],
                              ),
                            ),
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
                          onChanged: (val) {
                            print(val);
                            setState(() {
                              tags = [];
                              tags = val;
                            });
                            followingBloc.add(FollowingEventFollow(
                                type: "topics", id: tags.last));
                          },
                          choiceItems: C2Choice.listFrom<String, String>(
                            source: state.topicsStr,
                            value: (i, v) => state.dataTopic[i].id.toString(),
                            label: (i, v) => state.dataTopic[i].name,
                          ),
                        )
                      ],
                    );
                  } else if (state.status == FollowingStatus.failure) {
                    return Text("Error");
                  } else {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 3),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
