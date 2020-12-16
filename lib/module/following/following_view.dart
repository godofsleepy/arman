import 'package:arman/model/category.dart';
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
                    // state.dataTopic.map((val) => print(val.name));
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
                          height: 330,
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
                                ItemWebsite(sourceWeb: state.dataWeb[index],),
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
